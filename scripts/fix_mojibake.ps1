Param(
  [string]$Root = "C:\Users\Mr. R\Desktop\WARP-BMAD v2"
)

$ErrorActionPreference = 'Stop'

$changed = @()
$issues  = @()

# Replacement map for common mojibake
$map = [ordered]@{
  'â„¢' = 'TM'
  'â€”'  = '--'
  'â€“'  = '-'
  'â€•' = '--'
  'â€¦'  = '...'
  'â€œ'  = '"'
  'â€' = '"'
  'â€˜'  = "'"
  'â€™'  = "'"
  'â†’' = '->'
  'â†�' = '<-'
}

Get-ChildItem -Path $Root -Recurse -File -Filter *.md | ForEach-Object {
  $p = $_.FullName
  $t = Get-Content -LiteralPath $p -Raw -ErrorAction SilentlyContinue
  if(-not $t){ return }
  $n = $t

  foreach($k in $map.Keys){ $n = $n.Replace($k, $map[$k]) }

  # Remove common mojibake lead bytes and emoji remnants
  $n = $n.Replace('ðŸ','')
  $n = $n.Replace('ï¸','')
  $n = $n.Replace('Â','')
  $n = $n.Replace('Ã','')

  # Remove zero-width / variation selector / replacement char
  $n = $n -replace '\u200D','' -replace '\uFE0F','' -replace '\uFFFD',''

  # Balance code fences
  $fences = [regex]::Matches($n, '(?m)^```').Count
  if(($fences % 2) -ne 0){ $n += "`r`n```" }

  if($n -ne $t){ Set-Content -LiteralPath $p -Value $n -Encoding UTF8; $changed += $p }

  # Verify suspicious remnants
  if($n -match 'ðŸ|â„|â€¦|â€|ï¸|Ã|Â|�'){ $issues += $p }
}

Write-Host ("Changed files: " + $changed.Count)
$changed | ForEach-Object { Write-Host (" - " + $_) }
Write-Host ("Files with possible remaining issues: " + $issues.Count)
$issues  | ForEach-Object { Write-Host (" - " + $_) }
