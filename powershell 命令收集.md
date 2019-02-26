0. 官方文档

https://docs.microsoft.com/en-us/powershell/module

1. 查看系统的内存

Get-CimInstance Win32_PhysicalMemory

Get-WmiObject -class win32_physicalmemory | ft speed

2. 查看系统磁盘的剩余空间

Get-WMIObject Win32_LogicalDisk | Foreach-Object { 'Disk {0} has {1:0.0} MB space available' -f
$_.Caption, ($_.FreeSpace / 1MB) }

3.