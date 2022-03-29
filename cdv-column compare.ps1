$users = @{}
Import-Csv 'ltm.csv' | ForEach-Object {
    $users[$_.name] = $true
}

(Import-Csv 'testexport.csv') |
    Select-Object *,@{n='Duplicate';e={@($users.keys -match ($_.name)).Count -gt 0}} |
    Export-Csv 'file1.csv' -NoType


(Import-Csv 'testexport.csv') |
    Select-Object *,@{n='Duplicate';e={$users.ContainsKey($_.name)}} |
    Export-Csv 'file1.csv' -NoType

    @($names -like 'explorer*').Count -gt 0
