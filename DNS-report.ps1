$FinalResult = @()
$input_csv = ""

#importing the csv

 $vms = Import-Csv -path $input_csv


foreach ($vm in $vms) {   
     $tempObj = "" | Select-Object Name,PTR,Arecord,Status,ErrorMessage 
    try {     
           #$dnsRecorda = Resolve-DnsName $vm.FQDN  -ErrorAction Stop | Where-Object {$_.Type -eq 'A'}     
           $dnsRecordp = Resolve-DnsName $vm.Azure_IP  -ErrorAction Stop | Where-Object {$_.Type -eq 'PTR'}     
           $tempObj.Name = $vm.Azure_IP  
           $tempObj.Arecord = ($dnsRecorda.IPAddress -join ',')    
           $tempObj.PTR = ($dnsRecordp.NameHost -join ',')
          $tempObj.Status = 'OK'    
          $tempObj.ErrorMessage = ''    }    
    catch
     {        $tempObj.Name = $vm.Azure_IP 
            $tempObj.PTR = ''       
             $tempObj.Status = 'NOT_OK'       
             $tempObj.Arecord = ''
              $tempObj.ErrorMessage = $_.Exception.Message    }   
               $FinalResult += $tempObj
            }
            
            return $FinalResult | ft

$FinalResult  | Export-Csv DnsRecord.csv -NoTypeInformation
