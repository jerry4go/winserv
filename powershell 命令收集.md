0. 官方文档

https://docs.microsoft.com/en-us/powershell/module

1. 查看系统的内存

Get-CimInstance Win32_PhysicalMemory

Get-WmiObject -class win32_physicalmemory | ft speed

