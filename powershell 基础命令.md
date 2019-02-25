# 0. 官网

https://docs.microsoft.com/en-us/powershell/wmf/overview

# 1. 查看PowerShell版本信息

```powershell
$PSVersionTable.PSVersion
```

# 2. 查看某个命令对帮助信息和使用例子

```powershell
get-help Copy-Item -examples
```

# 3. 更新本地的帮助信息文档

```powershell
Update-Help -Verbose -Force -ErrorAction SilentlyContinue
```

