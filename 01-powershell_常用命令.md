0.脚本执行策略

![image](./static/get-executionpolicy.jpg)

1.查询带service 的命令

Get-Command -Noun service

![image](./static/get-command.jpg)

2.查看powershell所有的命令

Get-Command

3.获取当前系统的所有服务(包含启动和停止)

Get-Service

4.查看某个命令的帮助信息

Get-Help Get-Service

![image](./static/get-help.jpg)

5.查看某个命令的使用示例

Get-Help Get-Service -examples

6.在线查看某个命令的帮助信息

Get-Help Get-Service -online

7.查看某个别名的实际命令

Get-Alias cls

![image](./static/get-alias.jpg)

8.查看系统进程

Get-Process

![image](./static/get-process.jpg)

查看指定名字的进程

Get-Process -Name chrome

查看进程所有属性

Get-Process -Name chrome | Get-Member

查看进程所有的对象

Get-Process -Name QQ | Select-Object *

9.变量操作

![image](./static/methods.jpg)

10.查看历史操作记录

Get-History

history

11.






























