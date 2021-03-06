0.脚本执行策略

![image](./static/get-executionpolicy.jpg)

1.查询带service 的命令
```powershell
Get-Command -Noun service
```
![image](./static/get-command.jpg)

查看某个模块的所有命令参数

Get-Command -Module PSReadline

![image](./static/get-command02.jpg)


2.查看powershell所有的命令
```powershell
Get-Command
```
3.获取当前系统的所有服务(包含启动和停止)
```powershell
Get-Service
```
4.查看某个命令的帮助信息
```powershell
Get-Help Get-Service
```
![image](./static/get-help.jpg)

5.查看某个命令的使用示例
```powershell
Get-Help Get-Service -examples
```
6.在线查看某个命令的帮助信息
```powershell
Get-Help Get-Service -online
```
7.查看某个别名的实际命令
```powershell
Get-Alias cls
```
![image](./static/get-alias.jpg)

8.查看系统进程
```powershell
Get-Process
```
![image](./static/get-process.jpg)

查看指定名字的进程
```powershell
Get-Process -Name chrome
```
查看进程所有属性
```powershell
Get-Process -Name chrome | Get-Member
```
查看进程所有的对象
```powershell
Get-Process -Name QQ | Select-Object *
```
9.变量操作

![image](./static/methods.jpg)

10.查看历史操作记录
```powershell
Get-History

history
```
11.查询系统硬盘列表
```powershell
get-psdrive
```
![image](./static/get-psdrive.jpg)
```powershell
Get-PSDrive | Where-Object {$_.Free -gt 1}
```
 $_ 代表当前管道传过来的所有对象

![image](./static/get-psdrive02.jpg)
```powershell
Get-PSDrive | Where-Object {$_.Free -gt 1} | Select-Object Root,Used,Free
```
![image](./static/get-psdrive03.jpg)

```powershell
Get-PSDrive | Where-Object {$_.Free -gt 1} | ForEach-Object {Write-Host "Free Space for" $_.root "is"  $_.Free -ForegroundColor green}
```

![image](./static/get-psdrive04.jpg)

对空闲的硬盘空间进行单位换算和小数点位数保留

![image](./static/get-psdrive05.jpg)

```powershell
Get-PSDrive | Where-Object {$_.Free -gt 1} | ForEach-Object {$count = 0; Write-Host "";}  {$_.Name
": Used: " + "{0:N2}" -f ($_.Used/1gb) + " Free: " + "{0:N2}" -f ($_.Free/1gb) + " Total: " + "{0:N2}" -f (($_.Used/1g
+($_.Free/1gb)); $count = $count + $_.Free; } {Write-Host "";Write-Host "Total Free Space" ("{0:N2}" -f ($count/1gb))
ackgroundColor Magenta}
```
![image](./static/get-psdrive06.jpg)


12.查看当前系统安装的模块
```powershell
Get-Module
```

13.查看当前系统版本
```powershell
$PSVersionTable
```

14.查看当前系统时间
```powershell
get-date
```
![image](./static/get-date.jpg)

设置一个时间格式的变量的方法
```powershell
$betterdate = Get-Date "4/3/2019 10:30 PM"

$betterdate |Get-Member
```

![image](./static/get-date02.jpg)

日期格式化输出

![image](./static/get-date03.jpg)


15.查看系统日志

查看一天前的系统日志
```powershell
Get-EventLog System -After (Get-Date).AddDays(-1)
```

16.输出到屏幕

![image](./static/write-host.jpg)

对输出的字符设置字体颜色和背景颜色
```powershell
Write-Host "hello" -ForegroundColor Red -BackgroundColor blue
```

17.字符串输出到文件
```powershell
"my name is wangmeimei ." | Out-File out.txt

或者

"my name is wangmeimei ." | Tee-Object out2.txt
```
![image](./static/out-file.jpg)

18.输出警告和提示
```powershell
Write-Warning "this is demo for warning"
 
Write-Warning "this is demo for warning" -WarningAction Inquire
```
![image](./static/write-warning.jpg)

19.远程执行bat脚本
```
Invoke-Command  -Session $s -ScriptBlock 
{ 
c:/test/test.bat
d:/test/test02.ps1
}
```

本地执行
```
Invoke-Command -ScriptBlock {C:\PSInstall.bat}
```


20.将密码变成密文

`$p2 = ConvertTo-SecureString “XXXXXXX” -AsPlainText -Force`

$A = New-Object System.Management.Automation.PSCredential($na,$p2)

21.通过进程名获取进程ID

`$id  = Get-Process -name explorer* | Select-Object id | ForEach-Object -Process{$_.id}`

22.powershell 结束进程的四种写法

纯cmdlet命令

`Get-Process -Name notepad | Stop-Process`

cmdlet+遍历

`Get-Process -Name notepad | foreach-object{$_.Kill()} `

WMI 对象 + 遍历 + 对象方法 

`Get-WmiObject Win32_Process -Filter "name = 'notepad.exe'" | ForEach-Object{$_.Terminate()  | Out-Null }`

WMI 对象 + 遍历 + cmdlet方法

`Get-WmiObject Win32_Process -Filter "name = 'notepad.exe'" | Invoke-WmiMethod -Name Terminate | Out-Null`

23.优雅的关闭进程（无法通过远程执行）

`(Get-Process -Id 10024).CloseMainWindow()`

24.



 
 






























