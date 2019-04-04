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

`psexec \\远程机器ip [-u username [-p password]] [-c [-f]] [-i][-d] program [arguments]`

它的参数有：
```
-u后面跟用户名 -p后面是跟密码的,如果建立ipc连接后这两个参数则不需要。（如果没有-p参数，则输入命令后会要求你输入密码）

-c <[路径]文件名>:拷贝文件到远程机器并运行（注意：运行结束后文件会自动删除）

-d 不等待程序执行完就返回，（比如要让远程机器运行tftp服务端的时候使用，不然psexec命令会一直等待tftp程序结束才会返回）

-i 指定当前命令指向的用户会话ID

```

psexec \\远程机器ip -u abc -p 123 -c c:\tftp32.exe -d


## 2)psservice是一个服务管理程序。

`psservice [\\远程机器ip [-u username] [-p password]] <command> <options>`

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

## 3)pssuspend是一个暂时停止进程的软件

它的使用格式为：

`pssuspend [-r] [\\远程机器ip [-u username] [-p password]] <process name | process id>`

它有三个参数：
```
-u：后面跟用户名 -p：后面是跟密码的,如果建立ipc连接后这两个参数则不需要。（如果没有-p参数，则输入命令后会要求你输入密码）

-r:恢复进程。

比如要暂时停止一个pid号为999,名称为srm.exe的进程可以打：

pssuspend \\远程机器ip 999   或   pssuspend \\远程机器ip srm

如果想要恢复它就可以打pssuspend -r \\远程机器ip 999 或   pssuspend -r \\远程机器ip srm

```
## 4)psinfo是一个搜集机器软硬件信息的工具，它可以获得操作系统信息，硬件信息和软件信息。

它的使用格式为：

`psinfo [-h] [-s] [-d] [-c] [\\远程机器ip [-u username [-p password]]]`

它的参数有：
```
-u：后面跟用户名 -p：后面是跟密码的,如果建立ipc连接后这两个参数则不需要。（如果没有-p参数，则输入命令后会要求你输入密码）

-h：是显示它安装了哪些补丁包

-s：是显示它装了哪些软件

-d：是显示磁盘信息。

比如我只想看远程机器的软硬件信息和只用打:

psinfo \\远程机器ip

假如我还想看看它装了哪些补丁包可以打

psinfo -h \\远程机器ip

假如我还想看看它磁盘信息可以打：

psinfo -d \\远程机器ip

如果我想看它装了哪些软件可以打：

psinfo -s \\远程机器ip

```


## 5)pslist是一个查看进程的程序。

它的使用格式为：

pslist [-d] [-m] [-x][-t][-s [n] [-r n] [\\远程机器ip [-u username] [-p password]] [name | pid]

它的参数有：
```
-u：后面跟用户名 -p：后面是跟密码的,如果建立ipc连接后这两个参数则不需要。（如果没有-p参数，则输入命令后会要求你输入密码）
-s：是使用任务管理器模式实时查看进程，可以按ESC键退出。
-r <秒数>：是和-s连用的一个参数，它用来指定任务管理器模式是的刷新间隔。（默认的刷新间隔为1秒）
-d：示各个进程的cpu使用信息。
-m：显示各个进程的存储器使用信息。
-x：非常详细显示进程的所有信息。
-t：以树型方式显示进程。

比如要查看远程机器ip上的进程的cpu使用信息可以打:

pslist -d \\远程机器ip

比如要查看一个pid号为999,名称为srm.exe进程的存储器使用信息可以打：

pslist -m \\远程机器ip 999 或 pslist -m \\远程机器ip srm

比如要以任务管理器模式实时查看61.12.23.4上进程情况，并且刷新间隔为3秒可以打：

pslist -s -n 3 \\远程机器ip

```

## 6)psuptime是一个了解远程机器运行了多久的命令。

使用它只需要打：psuptime \\远程机器ip


## 7)psshutdown

psshutdown是一个远程关机命令。

它的使用格式为：

`psshutdown [[-s | -r | -k [-t nn][-m "消息"][-f]] -a | -l | -o] [\\远程机器ip]`

它的参数有：
```
-a：取消以前执行的关机指令。

-t：离关机还有多少秒。（默认是20秒）

-s：关闭机器。

-m：是要显示的信息。

-f：是关机是不保存运行的程序。

-r：表示重启。

-l：表示锁定电脑。

-o：表示注销用户。

比如我想让远程机器30秒后关闭并显示(要关机了，请保存文件)则打：

psshutdown -t 30 -s -m "要关机了，请保存文件" \\远程机器ip

如果是要重起的话打：

psshutdown -t 30 -m "要关机了，请保存文件" -r \\远程机器ip

如果要取消刚才的指令可以打：

psshutdown -a \\远程机器ip

```

## 8)psfile

psfile是一个显示机器上的会话和有什么文件被网络中的用户的打开的命令。

它的使用格式为：
```
psfile [\\远程机器ip [-u Username [-p Password]]] [[Id | path] [-c]]
```
它的参数有:
```
-u 后面跟用户名 -p后面是跟密码的,如果建立ipc连接后这两个参数则不需要。（如果没有-p参数，则输入命令后会要求你输入密码）
-c：关闭会话或文件

比如我想看看远程机器上的会话和被远程用户打开的文件可以打：

psfile \\远程机器ip

接着就会显示

[33] C:\WINNT
  User:   ADMINISTRATOR
  Locks: 0
  Access: Read
[63] \PIPE\srvsvc
  User:   ADMINISTRATOR
  Locks: 0
  Access: Read Write
  
接着我想关闭id为33，路径为c:\winnt的这个会话可以打

psfile \\远程机器ip 33 -c   或   psfile \\远程机器ip c:\winnt -c


```

## 9)psloggedon

psloggedon是一个显示目前谁登陆的机器的命令。

它的参数只有:

-l只显示本地登陆用户而不显示其它的网络登陆用户

-x不显示登陆时间

比如说要显示远程机器现在登陆的用户可以打：

psloggedon \\远程机器ip

## 10)psgetsid

psgetsid是一个远程获取账号sid信息的工具。

它的使用格式为：

psgetsid [\\远程机器ip [-u username [-p password]]] [account]

它的参数有

-u 后面跟用户名 -p后面是跟密码的,如果建立ipc连接后这两个参数则不需要。（如果没有-p参数，则输入命令后会要求你输入密码）

比如要看远程机器上账号名为abc的sid信息可以打：

psgetsid \\远程机器ip abc

## 11)pskill

pskill是一个杀除进程的程序。

它的使用格式为：

pskill [\\远程机器ip [-u username] [-p password]] <process name | process id>

比如要杀除一个pid号为999,名称为srm.exe的进程可以打：

pskill \\远程机器ip 999   或   pskill \\远程机器ip srm

(12)psloglist

psloglist

psloglist是一个查看系统事件记录的程序。

它的使用格式为：
```
psloglist [\\远程机器ip [-u username [-p password]]] [-s [-t delimiter]] [-n # | -d #] [-c][-x][-r][-a mm/dd/yy][-b mm/dd/yy][-f filter] [-l event log file] <eventlog> 
```
它的参数有：
```
-u 后面跟用户名 -p后面是跟密码的,如果建立ipc连接后这两个参数则不需要。

-c:显示事件之后清理事件记录

-l <事件记录文件名>:用于查看事件记录文件

-n <n>：只显示最近的n条系统事件记录。

-d <n>：只显示n天以前的系统事件记录

-a mm/dd/yy:显示mm/dd/yy以后的系统事件记录

-b mm/dd/yy:显示mm/dd/yy以前的系统事件记录

-f <事件类型>：只显示指定的事件类型的系统事件记录。

-x：显示事件数据代码

-r：从旧到新排列（如不加则默认是从新到旧排列）

-s:以一个事件为一行的格式显示，中间默认以逗号格开各个信息。

-t <字符>:这个参数和-s连用，以来改变-s中默认的逗号。

如果我想看远程机器的系统事件记录只用打：

psloglist \\远程机器ip 123

比如我想看最近的10条error类型的记录可以打：

psloglist \\远程机器ip -n 10 -f error














