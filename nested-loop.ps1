#nested loop example with custom object 
$alldir = @()

foreach ($child in (get-childitem -Directory)){
    $singledir = [PSCustomObject]@{}

    $singledir | Add-Member -Name parent-dir-name -Value $child.Name -MemberType NoteProperty
    $index = 0
    foreach ($child1 in (Get-ChildItem $child -Recurse -Depth 2)){
        $singledir | Add-Member -Name child-dir-name$($index) -Value $child1.Name -MemberType NoteProperty
        $index++
    }
   $alldir += $singledir
}

Write-Host $alldir


Function Get-Properties ($array) {                                
      $array |ForEach-Object{$_ | Get-Member |Where-Object{$_.MemberType -ne "Method"} | Select-Object -ExpandProperty Name} | Sort-Object -Unique
    }

    $finalalldir = $alldir | select -Property (get-properties $alldir) 
