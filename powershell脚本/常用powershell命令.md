根据端口杀进程
```powershell
Stop-Process -Id (Get-NetTCPConnection -LocalPort 9002).OwningProcess -Force
```
