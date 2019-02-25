1. 获取会话

远程访问服务器，首先是利用PowerShell的New-PSSession命令，填写远程服务器的管理员账号密码登陆，获取Session

Get-Credential是个交互函数，执行时会弹出一个用户名密码对话框，因此我们要人为构造一个PSCredential。改写一下方法

``` powershell
$pass=ConvertTo-SecureString -String 'your password' -AsPlainText -Force
$cre=New-Object pscredential('your username', $pass)
$session=New-PSSession -ComputerName $server -Credential $cre
```

2. 执行远程命令

获取Session以后，远程服务器已经完全落入我们的掌心。现在可以通过Invoke-Command远程执行命令，可以用Enter-PSSession直接进入远程会话，

可以通过Copy-Item实现文件传输。以下是我在部署过程中遇到的常用的命令。

2.1 远程停止Windows Service

```
Invoke-Command -Session $session -ScriptBlock{
    Stop-Service -Name 'your service name'
}
```

2.2 远程停止Web

```
Invoke-Command -Session $session -ScriptBlock{
    import-module webadministration
    set-location IIS:\
    $site=Get-Item 'IIS:\Sites\Ems.Webv2'
    $site.Stop()
}
```