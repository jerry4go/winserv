1.统计包含某字符串的行数。例如在统计网络连接时的TIME_WAIT数等

`netstat -an | find /i /c "TIME_WAIT"`    

这里/i参数是忽略大小写，/c参数是统计包含"TIME_WAIT"字符串的行数或记录数。

2.统计所有行数。find还有个选项/v，意为不包含某字符串的行数，使用该选项可以统计文本的行数，例如:

`type test.txt | find /v /c ""`
   
注意：文件中的空行除了最后一个空行不被统计外，其余的空行均可正确统计。

3.查看端口是否启动

`netstat -ano | findstr "8080"`


