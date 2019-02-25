### 1. 获取会话

远程访问服务器，首先是利用PowerShell的New-PSSession命令，填写远程服务器的管理员账号密码登陆，获取Session

Get-Credential是个交互函数，执行时会弹出一个用户名密码对话框，因此我们要人为构造一个PSCredential。改写一下方法

``` powershell
$pass=ConvertTo-SecureString -String 'your password' -AsPlainText -Force
$cre=New-Object pscredential('your username', $pass)
$session=New-PSSession -ComputerName $server -Credential $cre
```

### 2. 执行远程命令

获取Session以后，远程服务器已经完全落入我们的掌心。现在可以通过Invoke-Command远程执行命令，可以用Enter-PSSession直接进入远程会话，

可以通过Copy-Item实现文件传输。以下是我在部署过程中遇到的常用的命令。

### 2.1 远程停止Windows Service

```
Invoke-Command -Session $session -ScriptBlock{
    Stop-Service -Name 'your service name'
}
```

### 2.2 远程停止Web

```
Invoke-Command -Session $session -ScriptBlock{
    import-module webadministration
    set-location IIS:\
    $site=Get-Item 'IIS:\Sites\Ems.Webv2'
    $site.Stop()
}
```

### 2.3 本地文件拷贝

```
Copy-Item -Path "D:\\测试用文件.txt" -Destination "D:\\tt" -Force
```

### 2.4 拷贝本地文件到远程服务器

```
ls "local folder" | cp -Destination "remote folder" -ToSession $session -Recurse -Force
ls "C:\tmp" | cp -Destination "D:\tt" -ToSession $session -Recurse -Force
```

### 2.5 拷贝远程服务器文件到本地

```
cp -FromSession $session -Path "Remote File" -Destination "Local Folder" -Recurse -Force
cp -FromSession $session -Path "D:\tt\测试用文件3.txt" -Destination "D:\tt01" -Recurse -Force
```

### 3.1 将文件打包成zip

```
Compress-Archive "Folder" -DestinationPath "Zip File Name" -Force
Compress-Archive "D:\tt" -DestinationPath "D:\tt01.zip" -Force
```

### 3.2 将zip文件解压

```
Expand-Archive "Zip File Name" -DestinationPath "Folder" -Force
Expand-Archive "D:\tt01.zip" -DestinationPath "D:\tt01" -Force
```

### 4. 释放PSSession

```
Remove-PSSession -Id $session.Id #使用完毕后一定记得释放PSSesion

```




































