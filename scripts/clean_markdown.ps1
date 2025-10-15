Param(
  [string]$Root = "C:\Users\Mr. R\Desktop\WARP-BMAD v2"
)

$ErrorActionPreference = 'Stop'

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

$typos = @{
  'recieve' = 'receive'
  'seperate' = 'separate'  
  'definately' = 'definitely'
  'occured' = 'occurred'
  'accomodate' = 'accommodate'
  'enviroment' = 'environment'
  'adress' = 'address'
  'inital' = 'initial'
  'dependancies' = 'dependencies'
  'methodâ' = 'Method'
  'tmâ' = 'TM'
  'â' = ''
}

$report = Join-Path $Root 'qa_markdown_report.txt'
if(Test-Path $report){ Remove-Item $report -Force }

$changed = @()
$issues  = @()

Get-ChildItem -Path $Root -Recurse -File -Filter *.md | ForEach-Object {
  $p = $_.FullName
  $text = Get-Content -LiteralPath $p -Raw -ErrorAction SilentlyContinue
  if(-not $text){ return }

  $new = Remove-Emoji $text
  $new = $new -replace '\u200D','' -replace '\uFE0F','' -replace '\uFFFD',''

  foreach($k in $typos.Keys){ 
    $new = [regex]::Replace($new, [regex]::Escape($k), $typos[$k], 'IgnoreCase') 
  }

  $fencePattern = '(?m)^```'
  $fenceCount = ([regex]::Matches($new, $fencePattern)).Count
  if(($fenceCount % 2) -ne 0){ $new += "`r`n```" }

  if($new -ne $text){ 
    Set-Content -LiteralPath $p -Value $new -Encoding UTF8 -NoNewline
    $changed += $p 
  }

  $hasEmoji = $false
  $i=0
  while($i -lt $new.Length -and -not $hasEmoji){
    $adv=1; $cp=[int][char]$new[$i]
    if([char]::IsHighSurrogate($new[$i]) -and $i+1 -lt $new.Length -and [char]::IsLowSurrogate($new[$i+1])){ 
      $cp=[char]::ConvertToUtf32($new,$i)
      $adv=2 
    }
    if(($cp -ge 0x1F300 -and $cp -le 0x1FAFF) -or ($cp -ge 0x1F1E6 -and $cp -le 0x1F1FF) -or ($cp -ge 0x2600 -and $cp -le 0x27BF) -or $cp -eq 0xFE0F -or $cp -eq 0x200D -or $cp -eq 0xFFFD){ 
      $hasEmoji=$true
      break 
    }
    $i += $adv
  }
  if($hasEmoji){ $issues += $p }
}

Add-Content $report "Changed files: $($changed.Count)"
$changed | ForEach-Object { Add-Content $report $_ }
Add-Content $report "`nRemaining-issues files: $($issues.Count)"
$issues  | ForEach-Object { Add-Content $report $_ }

Write-Host "Markdown QA complete. Changed=$($changed.Count) Issues=$($issues.Count)."
Write-Host "Report: $report"