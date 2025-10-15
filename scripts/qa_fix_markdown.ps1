Param(
  [string]$Root = "C:\Users\Mr. R\Desktop\WARP-BMAD v2"
)

$ErrorActionPreference = 'Stop'

# Helper: remove emoji/VS/ZWJ/replacement
function Remove-Emoji([string]$s){
  $sb = New-Object System.Text.StringBuilder
  $i=0
  while($i -lt $s.Length){
    $advance=1; $cp=[int][char]$s[$i]
    if([char]::IsHighSurrogate($s[$i]) -and $i+1 -lt $s.Length -and [char]::IsLowSurrogate($s[$i+1])){
      $cp=[char]::ConvertToUtf32($s,$i); $advance=2
    }
    $isEmoji = (
      ($cp -ge 0x1F300 -and $cp -le 0x1FAFF) -or
      ($cp -ge 0x1F1E6 -and $cp -le 0x1F1FF) -or
      ($cp -ge 0x2600  -and $cp -le 0x27BF)  -or
      ($cp -ge 0x1F600 -and $cp -le 0x1F64F) -or
      ($cp -ge 0x1F680 -and $cp -le 0x1F6FF) -or
      ($cp -ge 0x1F900 -and $cp -le 0x1F9FF) -or
      ($cp -ge 0x1FA70 -and $cp -le 0x1FAFF) -or
      $cp -eq 0xFE0F -or $cp -eq 0x200D -or $cp -eq 0xFFFD
    )
    if(-not $isEmoji){
      if($advance -eq 2){ [void]$sb.Append($s[$i]); [void]$sb.Append($s[$i+1]) } else { [void]$sb.Append($s[$i]) }
    }
    $i += $advance
  }
  $sb.ToString()
}

# Common mojibake mappings -> ASCII equivalents (no emojis)
$map = [ordered]@{
  'â„¢' = 'TM'
  'â€”' = '--'
  'â€“' = '-'
  'â€•' = '--'
  'â€˜' = "'"; 'â€™' = "'"
  'â€œ' = '"'; 'â€' = '"'
  'â€¦' = '...'
  'â†’' = '->'
  'âœ…' = ''
  'âŒ' = ''
  'ï¸' = ''
}
# Known emoji-mojibake sequences to remove fully
$emojiLike = @(
  'ðŸ¤–','ðŸŽ¯','ðŸ“‹','ðŸƒ','ðŸ§ª','ðŸ“Š','ðŸ—ï¸','ðŸŽ¨','ðŸ“ˆ','ðŸŽ­','ðŸ”„','ðŸ“„','ðŸŽ‰','ðŸš€'
)

# Simple common typos (very conservative)
$typos = [ordered]@{
  'recieve' = 'receive'
  'seperate' = 'separate'
  'definately' = 'definitely'
  'occured' = 'occurred'
  'accomodate' = 'accommodate'
  'enviroment' = 'environment'
  'adress' = 'address'
  'inital' = 'initial'
  'dependancies' = 'dependencies'
}

# Ensure scripts dir exists for report
$report = Join-Path $Root 'qa_markdown_report.txt'
if(Test-Path $report){ Remove-Item $report -Force }

$changed = @()
$issues  = @()

Get-ChildItem -Path $Root -Recurse -File -Filter *.md | ForEach-Object {
  $p = $_.FullName
  $text = Get-Content -LiteralPath $p -Raw

  # Remove emojis and artifacts
  $new = Remove-Emoji $text

  # Apply explicit mappings
  foreach($k in $map.Keys){ $new = $new -replace [Regex]::Escape($k), [System.Text.RegularExpressions.MatchEvaluator]{ param($m) $map[$k] } }
  foreach($k in $emojiLike){ $new = $new -replace [Regex]::Escape($k), '' }

  # Normalize stray artifacts
  $new = $new -replace '\u200D','' -replace '\uFE0F','' -replace '\uFFFD',''

  # Fix conservative typos (whole words only)
  foreach($k in $typos.Keys){ $new = [regex]::Replace($new, "\b$([regex]::Escape($k))\b", $typos[$k]) }

  # Fix unbalanced code fences ``` if odd count
  $fenceCount = ([regex]::Matches($new, "(?m)^```" )).Count
  if(($fenceCount % 2) -ne 0){ $new += "`r`n```" }

  if($new -ne $text){ Set-Content -LiteralPath $p -Value $new -Encoding UTF8; $changed += $p }

  # Collect verification issues
  $hasEmoji = $false
  $i=0; while($i -lt $new.Length -and -not $hasEmoji){
    $adv=1; $cp=[int][char]$new[$i]
    if([char]::IsHighSurrogate($new[$i]) -and $i+1 -lt $new.Length -and [char]::IsLowSurrogate($new[$i+1])){ $cp=[char]::ConvertToUtf32($new,$i); $adv=2 }
    if(($cp -ge 0x1F300 -and $cp -le 0x1FAFF) -or ($cp -ge 0x1F1E6 -and $cp -le 0x1F1FF) -or ($cp -ge 0x2600 -and $cp -le 0x27BF) -or $cp -eq 0xFE0F -or $cp -eq 0x200D -or $cp -eq 0xFFFD){ $hasEmoji=$true; break }
    $i += $adv
  }
  if($hasEmoji -or ($new -match 'ðŸ|â„|â€¦|â€™|â€œ|â€|ï¸|�')){ $issues += $p }
}

Add-Content $report ("Changed files: " + $changed.Count)
$changed | ForEach-Object { Add-Content $report $_ }
Add-Content $report ("Remaining-issues files: " + $issues.Count)
$issues  | ForEach-Object { Add-Content $report $_ }

Write-Host "Markdown QA complete. Changed=$($changed.Count) Issues=$($issues.Count). Report: $report"
