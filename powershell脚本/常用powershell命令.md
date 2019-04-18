根据端口杀进程
```powershell
Stop-Process -Id (Get-NetTCPConnection -LocalPort 9002).OwningProcess -Force
```
根据进程名称杀进程
```powershell
get-process mongod | stop-process
```
根据命令行的路径来判断同一个进程名称的不同进程
```powershell
get-wmiobject win32_process | where commandline -match  cmdRoom.bat | remove-wmiobject
```
根据路径查询相关进程的指定列信息
```powershell
get-wmiobject win32_process | where commandline -match  cmdRoom.bat | seleclt CommandLine, ProcessID
```

```powershell
```

```powershell
```

```powershell
```

```powershell
```

```powershell
```
