1.�鿴��ǰĿ¼�Ͳ鿴Ŀ¼���ļ�
```powershell
Get-ChildItem .\AppData\

Get-Item .\AppData\
```
 
![image](./static/get-item.jpg)

2.�����µ�Ŀ¼
```powershell
mkdir demo

New-Item -ItemType Directory demo02
```
![image](./static/mkdir.jpg)


3.�����ļ���ĳ��Ŀ¼
```powershell
Copy-Item .\Downloads\dopdf8.8.946.0.exe '.\demo\'

cp .\Downloads\dopdf8.8.946.0.exe '.\demo02\'

```
![image](./static/cp.jpg)

������ǰĿ¼�����е��ļ�

Copy-Item * ..\..\demo\

������ǰĿ¼�µ��ļ����ļ����������Ŀ¼��ǿ�Ƹ���

Copy-Item * ..\..\demo\ -Recurse -Force

4.�ƶ���ɾ��ĳ���ļ� 

```powershell
Move-Item .\control.ps1 ..\..\demo02\

Remove-Item .\control.ps1
```



















 
