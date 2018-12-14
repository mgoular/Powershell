# Basically this is loading a list of servers and invoking one execution.
# This particular case its loading a list of servers from Get-content
# The invoke part in this case is flushing the DNS remotely to all of those machines previously loaded.


$servers = Get-Content -Path "C:\Temp\Servers.txt"
foreach ($s in $servers)
{
    Write-Host "Flushing DNS in $s..." -ForegroundColor Yellow
    if(!(Test-Connection $s -Count 2))
    {
        Write-Host "Can't connect to server $s!!!" -ForegroundColor Red
        continue
    }
    Invoke-Command -ComputerName $s -ScriptBlock{Clear-DnsClientCache}
    Write-Host "DNS in $s flushed Successfully..." -ForegroundColor Green
}
