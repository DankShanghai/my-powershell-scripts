# --------------------------------------------------------
# Multiple user
# --------------------------------------------------------



$users = @(
"info_ind_jp",
"betriebsrat.hoechstadt@schaeffler.com",
"REVESRLA",
"wirtmais",
"OR-ERL-SMB-ZSD",
"CR-ELT-8-25_0.01, Veitenstein",
"saitotka",
"STIAKRNA",
"PNACEDVI"
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



            get-mailbox $user | Select Name,RecipientTypeDetails, Serviceplan, servicename



            }