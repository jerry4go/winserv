# 1.国外大牛写的自建kms服务器软件

https://github.com/Wind4/vlmcsd


# 2.下载最新的包，部署到centos

下载

wget https://github.com/Wind4/vlmcsd/releases/download/svn1112/binaries.tar.gz

解压

tar -zxvf binaries.tar.gz

进入对应系统和平台的目录

cd binaries/Linux/intel/static/

运行

./vlmcsd-x64-musl-static

查看服务是否启动和端口是否监听

ps aux|grep -v grep|grep vlmcs

netstat -antp|grep 1688

如果服务器是部署在公网，还要开放端口1688

# 3.在windows 下 验证搭建的kms 服务器是否可用

同样下载安装包，解压

https://github.com/Wind4/vlmcsd/releases/download/svn1112/binaries.tar.gz

打开cmd进入以下目录

binaries\binaries\Windows\intel

验证

vlmcs-Windows-x64.exe -v -l 3 192.168.68.51

如果看到返回以下字符表示搭建成功

Connecting to 192.168.68.51:1688 ... successful

# 4.windows激活方法

用管理员权限打开cmd

slmgr /upk

slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX

slmgr /skms 192.168.68.51

slmgr /ato

slmgr /xpr

# 5.office激活方法

用管理员权限打开cmd

cd /d "%ProgramFiles%\Microsoft Office\Office15"

cscript ospp.vbs /sethst:192.168.1.100

cscript ospp.vbs /act

cscript ospp.vbs /dstatus

先查看旧的key,然后再卸载原先的key

cscript ospp.vbs /dstatus

cscript ospp.vbs /unpkey:AB12C

刷新命令

cscript ospp.vbs /remhst

# 注意点

1.激活的有效期只有180天

2.只对vl批量激活的windows和office有效






























