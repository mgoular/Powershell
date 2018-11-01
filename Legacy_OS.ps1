# Get the list of all machines with Windows Vista and earlier versions.

Get-ADcomputer -Filter {(operatingsystem -like "*xp*") -or (operatingsystem -like "*vista*") -or (operatingsystem -like "*Windows NT*")-or (operatingsystem -like "*2000*") -or (operatingsystem -like "*2003*")} -Property Name,OperatingSystem,OperatingSystemServicePack,lastlogontimestamp | Format-Table Name,OperatingSystem,OperatingSystemServicePack,@{name="lastlogontimestamp"; expression={[datetime]::fromfiletime($_.lastlogontimestamp)}} -Wrap -AutoSize
