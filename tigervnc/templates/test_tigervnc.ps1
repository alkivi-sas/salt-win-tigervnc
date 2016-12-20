$test =  Test-Path "HKLM:\SOFTWARE\TigerVNC"
if ($test) { EXIT 0 } else { EXIT 1 }

