1.查看当前目录和查看目录的文件
```powershell
Get-ChildItem .\AppData\

Get-Item .\AppData\
```
 
![image](./static/get-item.jpg)

2.创建新的目录
```powershell
mkdir demo

New-Item -ItemType Directory demo02
```
![image](./static/mkdir.jpg)
