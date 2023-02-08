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

function test($temp){
    while ($true){
        cls
        foreach($line in Get-Content .\$temp) {
            Ping($line)
        }
        sleep(5)
    }
}

function Show-Menu
{
     param (
           [string]$Title = ‘My Menu’
     )
     cls
     Write-Host “================ $Title ================”
    
     Write-Host “1: Press ‘1’ for this option.”
     Write-Host “2: Press ‘2’ for this option.”
     Write-Host “3: Press ‘3’ for this option.”
     Write-Host “Q: Press ‘Q’ to quit.”
}

do
{
     Show-Menu
     $input = Read-Host “Please make a selection”
     switch ($input)
     {
           ‘1’ {
                cls
                test('IP_List.txt')
           } ‘2’ {
                cls
                ‘You chose option #2’
           } ‘3’ {
                cls
                ‘You chose option #3’
           } ‘q’ {
                return
           }
     }
     pause
}
until ($input -eq ‘q’)
