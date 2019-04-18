根据端口杀进程
```powershell
Stop-Process -Id (Get-NetTCPConnection -LocalPort 9002).OwningProcess -Force
```
根据进程名称杀进程
```powershell
get-process mongod | stop-process
```

```powershell
```

```powershell
```

```powershell
```
