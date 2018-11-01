# The following cmdlet lists all computer accounts in a domain set so that the computer account passwords do not expire.

Get-ADComputer -Filter 'useraccountcontrol -band 65536' -Properties useraccountcontrol | FT Name
