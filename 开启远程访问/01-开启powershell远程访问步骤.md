1.检查 WinRM 服务
```powershell
Get-Service WinRM
```
2.配置系统接受远程命令
```powershell
Enable-PSRemoting –Force
```
3.配置信任主机
```powershell
Set-Item wsman:\localhost\client\trustedhosts *

Restart-Service WinRM
```
4.测试远程连接
```powershell
Test-WsMan xxx.xxx.xxx.xxx
```
5.创建远程连接 Session
```powershell
Enter-PSSession -ComputerName x.x.x.x -Credential administrator
```
6.远程执行单个命令
```powershell
Invoke-Command -ComputerName x.x.x.x -ScriptBlock { Get-Service WinRM } -credential administrator
```
以上命令需要手动输入密码，无法自动化

下面命令则可以实现自动化
```powershell
$Username = 'xxxx'
$Password = 'yyyy'
$pass = ConvertTo-SecureString -AsPlainText $Password -Force
$Cred = New-Object System.Management.Automation.PSCredential -ArgumentList $Username,$pass
Invoke-Command -ComputerName cd-lsr-svr -ScriptBlock { Get-Service WinRM } -credential $Cred
```
7.远程执行多个命令

有时候我们需要连续执行多个有关联的命令，比如后一条命令会用到前一条命令的结果。

此时再使用上面的方法就不行了。需要通过 session 来处理命令之间的联系。
```powershell
Invoke-Command -ComputerName x.x.x.x -ScriptBlock {$p = Get-Process PowerShell}
Invoke-Command -ComputerName x.x.x.x -ScriptBlock {$p.VirtualMemorySize}
 
$s = New-PSSession -ComputerName x.x.x.x

Invoke-Command -Session $s -ScriptBlock {$p = Get-Process PowerShell}
Invoke-Command -Session $s -ScriptBlock {$p.VirtualMemorySize}
```

当我们直接执行前两个命令时，由于第二个命令中的 $p 没有值，所以不能获得结果。

最后两行的命令是通过同一个 session 执行的，所以它们可以共享变量，并最终获得结果。


8.远程执行脚本

```powershell
Invoke-Command -ComputerName server01 -FilePath .\task.ps1
```

9.在多个机器上执行相同的操作

ComputerName 属性指定多个目标，即可实现多主机同时执行
```powershell
Invoke-Command -ComputerName server01,server02 -FilePath .\task.ps1
```
如果目标主机很多，还可以把它们写到文件中，然后通过下面的方式引用：
```powershell
Invoke-Command -ComputerName (Get-Content Machines.txt)
```
10.远程拷贝文件

拷贝文件
```powershell
$mySession = new-PSSession -ComputerName xxxxxx

Copy-Item -Path .\task.ps1 -Destination C:\task.ps1 -ToSession $mySession
```

上面的命令把本地当前目录下的 task.ps1 文件拷贝到远程主机 xxxxxx 的 C 盘根目录下。

拷贝目录
```powershell
$mySession = new-PSSession -ComputerName xxxxxx

Copy-Item -Path .\PowerShell -Destination C:\PowerShell -ToSession $mySession -Recurse
```
注意目录拷贝操作要加上 Recurse 参数。


把远程主机上的文件或文件夹拷贝到本机来
```powershell
$mySession = new-PSSession -ComputerName xxxxxx

Copy-Item -Path C:\task.ps1 -Destination F:\temp\task.ps1 -FromSession $mySession

Copy-Item -Path C:\PowerShell -Destination F:\temp -FromSession $mySession -Recurse
```
注意这里使用的参数是 FromSession，所以命令中的 Destination 指定的是本地路径。

执行上面的命令，看看是不是已经把内容拷贝到本地的 F:\temp 目录下了！























