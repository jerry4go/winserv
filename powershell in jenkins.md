1. 获取会话

远程访问服务器，首先是利用PowerShell的New-PSSession命令，填写远程服务器的管理员账号密码登陆，获取Session

Get-Credential是个交互函数，执行时会弹出一个用户名密码对话框，因此我们要人为构造一个PSCredential。改写一下方法

``` powershell
$pass=ConvertTo-SecureString -String 'your password' -AsPlainText -Force
$cre=New-Object pscredential('your username', $pass)
$session=New-PSSession -ComputerName $server -Credential $cre
```
