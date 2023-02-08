cls
function Ping($test){
    $temp=$test.split(" ")[1]
    $IP=$test.split(" ")[0]
    if ( $IP ) {
        $success = Test-Connection $IP -Count 1 -Quiet -ErrorAction SilentlyContinue
        if ( $success ) {
            Write-Host -ForegroundColor Green "Ping succeeded for $IP, $temp"
        }
        else {
            Write-Host -ForegroundColor Red "Ping failed for $IP, $temp"
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