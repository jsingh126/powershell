$import = Import-Csv .\mycsv.csv | select hostname,hash 
foreach ($vmhost2 in ($import| Group hostname)){
    Write-Host "Connecting to $($vmhost2.name)"
    Write-Host $vmhost2.group
    Write-Host $vmhost2.group.hash
    foreach ($myhash in $vmhost2.group.hash) 
    { 
        #Write-Host "Executing magic for $($vmhost2.Name) with $myhash"
    }
 }
