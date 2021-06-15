// Compare 2 or more users
// Get the memberof groups and compare

################################################################################
################################################################################
## Script description                                                         ##
##                                                                            ##
## Name      : PsGroup-Comparison.ps1                                         ##
## Version   : 0.1                                                            ##
## Date      :                                                                ##
## Language  : PowerShell cmd-lets                                            ##
## License   : MIT                                                            ##
## Owner     : M.G                                                            ##
## Authors   : M.G                                                            ##
################################################################################
################################################################################

$groupsUSER1 = Get-ADUser USER1 -Properties memberOf | Select-Object -ExpandProperty memberOf

$groupsUSER2 = Get-ADUser USER2 -Properties memberOf | Select-Object -ExpandProperty memberOf

// You can keep using the same format 
// Compare the membership 

Compare-Object $groupsUSER1 $groupsUSER2 | Where-Object { $_.InputObject -notlike "CN=Lst*" -and $_.InputObject -notlike "CN=Shared*" }
