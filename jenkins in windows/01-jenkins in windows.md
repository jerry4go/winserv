### 1. 官网下载

http://mirrors.jenkins.io/

http://mirrors.jenkins.io/windows-stable/

### 2.  默认配置

默认端口 8080

默认安装路径 C:\Program Files (x86)\Jenkins

默认服务 Jenkins 配置为开机自动启动

### 3.  安装插件

PowerShell

### 4.  修改Jenkins 服务为管理员账户启动 

![image](./static/logon.jpg)

### 5.  配置账号密码通过加密文本来绑定

![image](./static/secret.jpg)

![image](./static/secret02.jpg)

![image](./static/secret03.jpg)

![image](./static/secret031.jpg)

![image](./static/secret04.jpg)

在构建任务中进行调用

![image](./static/secret05.jpg)


### 6.  根据SVN tag 参数构建

![image](./static/svntag01.jpg)

![image](./static/svntag02.jpg)

SVN仓库分别创建两个目录，tags用于存放打的tag,trunk作为主干分支，用于提交代码

![image](./static/svntag03.jpg)

打tag前，需要先把当前代码提交 svn commit

![image](./static/svntag04.jpg)

填写一个新的tag编号

![image](./static/svntag05.jpg)


