# Review accounts that never had a password set
Get-ADObject -LDAPFilter:"(&(objectCategory=person)(objectClass=user)(!userAccountControl:1.2.840.113556.1.4.803:=2)(!userAccountControl:1.2.840.113556.1.4.803:=65536)(|(userAccountControl:1.2.840.113556.1.4.803:=8388608)(pwdLastSet=0)))"
