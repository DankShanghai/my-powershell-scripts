﻿#Connect to Exchange OnPrem first#



# --------------------------------------------------------
# Single user
# --------------------------------------------------------



<#
$user = "telisvta"

Enable-Mailbox $user -Archive -ArchiveDatabase DE-Herzogenaurach-ADB02

Get-Mailbox $user | Select Name,ArchiveDatabase
#>



# --------------------------------------------------------
# Multiple user
# --------------------------------------------------------



$users = @(
"desaihrs",
"hoesssen",
"ZILLIRMI"
)



        #-------------------------
        # Activity progress
        #-------------------------

        $ActivityString = "Verifying users"
            Write-Progress -Activity $ActivityString -Status "analyzing..."
            $i = 0
            $counter = ($users | Measure-Object).count

        foreach ($user in $users)
        {
              $i++
            $percentComplete=[System.Convert]::ToInt32($i/$counter*100)
            Write-Progress -Activity $ActivityString -PercentComplete $percentComplete -CurrentOperation "Processing user: $($user.name)" -Status "Completed: $percentComplete`% ($i/$counter)"



            Enable-Mailbox $user -Archive -ArchiveDatabase DE-Herzogenaurach-ADB02

            Get-Mailbox $user | Select Name,ArchiveDatabase



            }