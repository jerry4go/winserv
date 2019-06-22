1.统计包含某字符串的行数。例如在统计网络连接时的TIME_WAIT数等

`netstat -an | find /i /c "TIME_WAIT"`    

这里/i参数是忽略大小写，/c参数是统计包含"TIME_WAIT"字符串的行数或记录数。

2.统计所有行数。find还有个选项/v，意为不包含某字符串的行数，使用该选项可以统计文本的行数，例如:

`type test.txt | find /v /c ""`
   
注意：文件中的空行除了最后一个空行不被统计外，其余的空行均可正确统计。

3.查看端口是否启动

`netstat -ano | findstr "8080"`

4.杀掉指定端口对应的进程

cmd命令下面的直接执行的写法

`FOR /F "tokens=4 delims= " %P IN ('netstat -a -n -o ^| findstr :8080') DO TaskKill.exe /PID %P`

批处理bat文件内执行的写法

`FOR /F "tokens=4 delims= " %%P IN ('netstat -a -n -o ^| findstr :8080') DO TaskKill.exe /PID %%P`

根据不同的系统，对应进程ID的位置调节tokens=4 的值

5.进程ID操作命令

通过进程ID获取具体的执行命令

`wmic process where "ProcessID=1111" get CommandLine, ExecutablePath`

通过进程名获取进程ID

`wmic service where name='schedule' get ProcessId`

通过父进程ID获取对应的子进程

`wmic process where ParentProcessId=288`

模糊获取

wmic printer where "not DriverName like '%HP%'" Get Name, PortName, DriverName

6.强制杀进程和优雅杀进程

`taskkill /PID 827`
 
结束进程ID 是827 的进程。
 
`taskkill /F /IM notepad.exe`
  
强制结束所有的文本编辑器进程
 
`taskkill /F /FI "USERNAME eq Quinn" `
 
强制结束用户名是Quinn 的所有进程




























