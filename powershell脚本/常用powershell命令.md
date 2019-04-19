根据端口杀进程
```powershell
Stop-Process -Id (Get-NetTCPConnection -LocalPort 9002).OwningProcess -Force
```
根据进程名称杀进程
```powershell
get-process mongod | stop-process
```
根据命令行的路径来判断同一个进程名称的不同进程
```powershell
get-wmiobject win32_process | where commandline -match  cmdRoom.bat | remove-wmiobject
```
根据路径查询相关进程的指定列信息
```powershell
get-wmiobject win32_process | where commandline -match  cmdRoom.bat | seleclt CommandLine, ProcessID
```
删除文件或者文件夹
```powershell

删除一个文件
Remove-Item c:/scripts test.txt

删除目录里面的所有文件
Remove-Item c:/scripts/* -recurse

排除删除的文件后缀
Remove-Item c:/scripts/* -exclude *.wav

删除指定后缀的文件
Remove-Item c:/scripts/* -include .wav,.mp3

排除和删除指定文件
Remove-Item c:/scripts/* -include *.txt –exclude *test*

模拟命令会删除哪些文件，实际并不删除，只是演练
Remove-Item c:/scripts/*.vbs -whatif

```
文件重命名
```powershell
这里有一个命令从C:/ Scripts 文件夹下复制文件 Test.txt  到C: /Test 文件夹：

Copy-Item c:/scripts/Test.txt  c:/Test

在 C:/Scripts（包括要覆盖的文件夹） 复制所有项目到 C:/Test

Copy-Item c:/scripts/*  c:/Test

在 C:/Scripts 里只复制 .txt 文件到 C:/Test 

Copy-Item c:/scripts/*.txt  c:/Test

复制一个文件夹 C:/Scripts 复制到文件夹 C:/Test 里

Copy-Item c:/scripts c:/Test –recurse


```

文件操作

```powershell
创建一个目录

New-Item -Path E:\PSTest\NewDir -ItemType Directory –Force

创建一个文件

New-Item -Path E:\PSTest\NewDir\new.txt -ItemType File –Force 

复制文件

copy-Item -Path E:\PSTest\NewDir\new.txt -Destination D:\ -PassThru –Force

复制目录

Copy-Item -Path E:\PSTest\NewDir -Destination D:\ -PassThru -Force –Recurse

打开文件

Invoke-Item C:\Windows\win.ini
```


字符串截取
```powershell
("we-rt-192.168.12.11-45.exe" -split "-")[2]
标签号是从0开始的
```



```powershell
```

```powershell
```
