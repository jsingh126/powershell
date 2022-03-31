## Installing the dns client
Install-Module -Name DnsClient-PS

## Azure vm tags
## https://stackoverflow.com/questions/58345592/azure-powershell-tagging-vms-from-csv-file

## save error to variable
$r = $($output = Test-Connection esx1.mylab.local) 2>&1

