@echo off
set SrcDir=D:\logs 
set DaysAgo=5 
forfiles /P %SrcDir% /s /m *.log /d -%DaysAgo% /c "cmd /c del /f /q /a @path"

// 删除指定路径 log后缀的日志