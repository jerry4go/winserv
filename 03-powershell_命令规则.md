1. powershell 命令规则

由短划线 (-) 分隔的动词和名词

比如 Get-Help、Get-Process 和 Start-Service

总共有四类动词

get cmdlet 仅检索数据

set cmdlet 仅建立或更改数据

format cmdlet 仅设置数据格式

out cmdlet 仅将输出定向到指定的目标

2. 查看某个命令的具体参数


get-help <cmdlet-name> -detailed

cmdlet 帮助文件的详细视图包括 cmdlet 说明、命令语法、参数说明和演示 cmdlet 用法的示例

3. 查看某个命令的所有对象

get-service | get-member 

4. powershell 脚本后缀

powerscp.ps1

Windows PowerShell 还包括一种非常丰富的脚本语言，使用该语言可以创建从最简单到非常复杂的脚本。

它支持用于循环、条件、流控制和变量赋值的语言结构。

5. get-help 相关参数

get-help get-command

get-help about_execution_policies

get-help get-command -detailed

get-help get-command -full

get-help get-command -examples

get-help get-command -parameter totalcount

get-help get-command -parameter *

get-help get-process -online

man get-command

help get-command


get-help get-*


get-help about_wildcards


get-help about_*


6. 命令

get-date

get-command

get-command -name *.exe

获取有关 Server01 远程计算机上 BIOS 的信息

get-wmiobject win32_bios -computername server01

如果需要任何 cmdlet 的帮助，请键入：

get-help <cmdlet-name> -detailed

get-help get-alias -detailed


7. 函数

查找会话中的所有函数

get-command -CommandType function


函数格式：

function <name> { <commands> }

例如：

function GMEX {get-help get-member -examples}

8. 模块

模块是包含可以在 Windows PowerShell 中使用的命令和其他项的程序包。

导入模块

import-module <module-name>

import-module c:\ps-test\TestCmdlets


9. 对象

Get-Member 是最有用的 cmdlet 之一，它显示有关命令返回的 .NET Framework 对象的信息。该信息包括对象的类型、属性和方法。


get-service | get-member

若要列出特定服务的属性的值，请键入：

(get-service <service-name>).<property-name>

(get-service alerter).canpauseandcontinue

若要显示 Alerter 服务的 CanPauseAndContinue 属性的名称和值的列表，请键入：

get-service alerter | format-list -property name, CanPauseAndContinue

若要显示 Alerter 服务的所有属性值的列表，请键入：

get-service alerter | format-list -property *

若要显示所有服务的 CanPauseAndContinue 属性的名称和值的表，请键入：

get-service | format-table -property name, CanPauseAndContinue

10.命令输出格式











