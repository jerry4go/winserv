# 0.脚本演进：

批处理  文件后缀 .bat

VBS    文件后缀 .vbs

pw     文件后缀 .ps1

# 常用命令：

### 1. 查看 powershell 版本

![image](./static/get-host.jpg)

### 2.  输出 hello Powershell

write-host "hello Powershell"

或者

echo "hello Powershell"

![image](./static/write-host-echo.jpg)


### 3. 定义变量

$a=12

或者

Set-Variable -name a -Value "12"

![image](./static/define.jpg)


### 4. 获取变量

$a

或者

Get-Variable a

或者

Write-Output $a

### 5. 创建数组

 $a = @("john",42,"jane")
 
### 6. 获取数组的某个值

![image](./static/group01.jpg)

### 7. 更新数组的值

![image](./static/group02.jpg)

### 8. hash 数组

![image](./static/hash.jpg)

### 9. 控制语句

if

![image](./static/control-if.jpg)

switch

![image](./static/control-switch.jpg)

break 满足条件即退出

条件进行判断

![image](./static/control-break.jpg)

default 设置默认值

![image](./static/control-default.jpg)

### 10. 循环语句

for 自增输出

foreach 遍历数组

while 循环

![image](./static/for-foreach-while.jpg)
