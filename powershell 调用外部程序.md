1、Get-Process，返回进程。
```
Get-Process [-id] ，按pid获取
Get-Process -name ，按进程名
Get-Process -inputObject ，传入参数
举例：get-process -name mmc，显示所有mmc的进程。
```
2、Start-Process，启动一个进程
```
语法：Start-Process -FilePath <可执行文件的路径> -ArgumentList <参数列表>
说明：在PowerShell v2.0以上才支持！
```

3、Stop-Process，停止一个或多个正在运行的进程。
```
Stop-Process [-id] ，停止指定的pid数组的进程
Stop-Process -name ，停止一组进程名列表
Stop-Process -inputObject ，停止一个Process类型的进程数组里面的所有进程。

如：Stop-Process -name notepad，这个功能也可以这样实现：
$pro = Get-Process -name notepad; $pro.Kill(); 或 (Get-Process -name notepad).Kill();

Windows提供了一个taskkill.exe程序，通过它也可以停止程序：taskkill /f /im java.exe
用这个命令，当我们要结束在cmd.exe里面运行的java.exe时，我们只结束java.exe，这个时候cmd也会被结束。
```

4、使用点（.）调用ps1或批处理文件（Invoke-Expression）
```
语法：. 
说明：可以在PowerShell交互环境中和PS1文件中调用现有的PS1文件，使用点（.）作为调用符。
我曾经试过使用Invoke-Item，好像没有启动得了。
也可以使用Invoke-Expression（Alias为iex）命令来实现，有两种用法：
C:\PS>invoke-expression -command "C:\ps-test\testscript.ps1"
C:\PS> "C:\ps-test\testscript.ps1" | invoke-expression
注意：这里可以使用ps1，也可以使用其它可执行的批处理文件，如.cmd、.bat等。
```

5、以默认打开方式打开文件（Invoke-Item）
```
语法：Invoke-Item <要打开的文件路径>
举例：Invoke-Item "c:\1.txt" #将使用txt文件的默认打开工具（即记事本）打开c:\1.txt
说明：文件必须存在，否则会报告“该路径不存在”的错误。
```

6、使用&调用程序
```
语法：& <可执行文件路径> [<参数列表>]
举例：
$execPath="D:\Progra~1\FlashFXP\flashfxp.exe"
$execArgs="-upload ftp://u:p@ip:21 "
$execArgs=$execArgs+"-remotepath=`"/`" "
$execArgs=$execArgs+"-localpath=`"d:\123\`" "
& $execPath $execArgs.Split()
```
7、使用cmd执行DOS内部或外部命令
```
说明：有很多DOS命令被CmdLet的别名占用了，所以如果还像之前一样使用就会发现参数可能不正确了。
为了可以与以前批处理里面用法兼容，可以使用cmd /c来调用DOS内部或外部命令。
语法：cmd /c 
举例：cmd /c del /s /q D:\testdir\testsubdir\*.*
```