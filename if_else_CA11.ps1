$users = @(
"Admin1",
"Admin2",
"Admin3",
"Admin4"
)


$CA11 = "EXO"


    foreach($user in $users){
    
                  $i++
            $percentComplete=[System.Convert]::ToInt32($i/$counter*100)
            Write-Progress -Activity $ActivityString -PercentComplete $percentComplete -CurrentOperation "Processing user: $($user.name)" -Status "Completed: $percentComplete`% ($i/$counter)"
    
    

            get-mailbox -identity $user | ft customattribute11

            
  
    # --------------------------------------------------------
    #Check if user has CustomAttribute11 set to EXO
    # --------------------------------------------------------
    
    If ($CA11 -eq "EXO") 
            {

            Write-Host "$user has correct customattribute11" -foregroundcolor "green"

            } 
            Else {

            Write-Host "$user has correct customattribute11 " -foregroundcolor "red"

            }
      }
