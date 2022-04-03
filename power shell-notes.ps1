## Installing the dns client
Install-Module -Name DnsClient-PS

## Azure vm tags
 https://stackoverflow.com/questions/58345592/azure-powershell-tagging-vms-from-csv-file

## save error to variable, $r saves the error and $output has the exact output of the error.
$r = $($output = Test-Connection esx1.mylab.local) 2>&1

# generate csv data
https://www.convertcsv.com/generate-test-data.htm

# Get the time in current zone 
$(((get-date)).ToString("yyyyMMddTHHmmssZ"))
