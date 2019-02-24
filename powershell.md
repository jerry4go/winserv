# 0.脚本演进：

批处理  文件后缀 .bat

VBS    文件后缀 .vbs

pw     文件后缀 .ps1

# 常用命令：

### 1. 查看 powershell 版本

Get-host 

### 2.  输出 hello Powershell

write-host "hello Powershell"

或者

echo "hello Powershell"

### 3. 定义变量

$a=12

或者

Set-Variable -name a -Value "12"

### 4. 获取变量

$a

或者

Get-Variable a

或者

Write-Output $a

5. 创建数组

 $a = @("john",42,"jane")
 
6. 获取数组的某个值

 $a[0]


