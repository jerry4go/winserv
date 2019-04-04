# 1.pstools简介

pstools 是微软推出的远程管理工具

由于powershell 无法访问指定会话，所以无法在同一个会话下打开应用

而pstools可以访问指定的远程会话，来执行命令

# 2.pstools官网下载地址

https://docs.microsoft.com/en-us/sysinternals/downloads/psexec

# 3.查看当前远程桌面的会话ID

cmd----quser

假设远程桌面的会话ID 为123

则以下命令可以在远程桌面打开一个计算器

psexec -s -i 123 calc.exe

# 4.pstools开放的端口

TCP 135

TCP 445

随机端口 TCP  49670~。。。

# 5.相关应用

## 1)psexec是一个远程执行工具

它的使用格式为：

psexec \\远程机器ip [-u username [-p password]] [-c [-f]] [-i][-d] program [arguments]

它的参数有：
```
-u后面跟用户名 -p后面是跟密码的,如果建立ipc连接后这两个参数则不需要。（如果没有-p参数，则输入命令后会要求你输入密码）

-c <[路径]文件名>:拷贝文件到远程机器并运行（注意：运行结束后文件会自动删除）

-d 不等待程序执行完就返回，（比如要让远程机器运行tftp服务端的时候使用，不然psexec命令会一直等待tftp程序结束才会返回）

-i 指定当前命令指向的用户会话ID

```

psexec \\远程机器ip -u abc -p 123 -c c:\tftp32.exe -d


## 2)psservice是一个服务管理程序。

psservice [\\远程机器ip [-u username] [-p password]] <command> <options>

它的参数只有：
```
-u 后面跟用户名 -p后面是跟密码的,如果建立ipc连接后这两个参数则不需要。（如果没有-p参数，则输入命令后会要求你输入密码）

它的command有：

query [服务名]:显示某一服务的状态，如不填服务名则显示所有服务的状态。
config <服务名>：显示某一服务的配置。
start <服务名>：启动某一服务。
stop <服务名>：停止某一服务。
testart <服务名>：停止某一服务并重新启动它。
pause <服务名>：暂停某一服务。
cont <服务名>：恢复暂停的服务。
depend <服务名>：显示某一服务依存关系。
find <服务名>：在网络种搜寻指定的服务。

比如你想查看在远程机器上的telnet服务的状态可以打：

psservice \\远程机器ip query tlntsvr     （tlntsvr为telnet服务的服务名）

比如你查看远程机器上的telnet服务的配置可以打：

psservice \\远程机器ip config tlntsvr

比如你想启动远程机器上的telnet服务可以打：

psservice \\远程机器ip start tlntsvr

```
























