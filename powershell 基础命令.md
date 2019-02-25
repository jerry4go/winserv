# 1. 查看PowerShell版本信息

```
$PSVersionTable.PSVersion
```

# 2. 查看某个命令对帮助信息和使用例子

```
get-help Copy-Item -examples
```

# 3. 更新本地的帮助信息文档

```
Update-Help -Verbose -Force -ErrorAction SilentlyContinue
```

