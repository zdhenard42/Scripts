cls
function Ping($IP){
    if ( $IP ) {
        $success = Test-Connection $IP -Count 1 -Quiet -ErrorAction SilentlyContinue
        if ( $success ) {
            Write-Host -ForegroundColor Green "Ping succeeded for $IP"
        }
        else {
            Write-Host -ForegroundColor Red "Ping failed for $IP"
        }
      }
    else {
    break
    }
    
}

while ($true){
    cls
    foreach($line in Get-Content .\IP_List.txt) {
        Ping($line)
    }
    sleep(5)
}