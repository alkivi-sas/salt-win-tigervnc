$a = "Running"
$b =  Get-Service -Name TigerVNC | foreach{ $_.Status}
$test = $a -eq $b
if ($test) { EXIT 0 } else { EXIT 1 }

