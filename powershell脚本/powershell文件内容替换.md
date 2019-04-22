获取文件内容

```powershell

PS C:\> Get-Content -path C:\ReplaceDemo.txt
The quick brown fox jumped over the lazy dog

```

获取文件内容，并对文件进行格式化，返回每个字符串

```powershell

PS C:\> Get-Content -path C:\ReplaceDemo.txt -Raw
The quick brown fox jumped over the lazy dog

```

替换文件字符串

```powershell

PS> (Get-Content -path C:\ReplaceDemo.txt -Raw) -replace 'brown','white'
The quick white fox jumped over the lazy dog

```
替换文件字符串，并保存到文件中，重新获取文件内容，确认是否修改成功

```powershell

PS C:\> ((Get-Content -path C:\ReplaceDemo.txt -Raw) -replace 'brown','white') | Set-Content -Path C:\ReplaceDemo.txt
PS C:\> Get-Content -path C:\ReplaceDemo.txt
The quick white fox jumped over the lazy dog


如果修改的内容中包含中文字符，请进行UTF-8编码，否则会乱码，这是一个大坑

(Get-Content -path "c:\temp\test.txt") | Set-Content -Encoding UTF8 -Path "c:\temp\test.txt"

```
