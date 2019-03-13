### 1. 重启某个IIS的站点
```powershell
Import-Module WebAdministration

Stop-Website "testweb"
 
Start-Website "testweb"
```
###  2. 重启某个IIS站点的应用程序池(回收)
```powershell
Restart-WebAppPool "testweb"
```