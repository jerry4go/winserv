1. 状态: 服务器发回了不可路由的地址。使用服务器地址代替。

解决方法：更改Filezilla设置，编辑-设置-连接-FTP-被动模式，将“使用服务器的外部ip地址来代替”改为“回到主动模式”即可。

2. FileZilla Server 下载文件时提示 550 Could not open file for reading 的解决方法

它是因为下载的这个文件被别的程序占用了，所以导致无法下载。

打开 FileZilla Server 管理界面-设置-Miscellaneous-Allow downloading of files which are open for writing by another process.


![image](./static/ftp01.png)



