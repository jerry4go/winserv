1.遍历数字并把乘积输出
```powershell
$array=7..10

foreach ($n in $array)

{

 $n*$n

}

```

输出结果
```
49
64
81
100
```

2.输出 目录 D:09PHP 小于1mb的文件名


```powershell
foreach($file in dir D:09PHP)

{

    if($file.Length -lt 1mb)

    {
    
        $file.Name

    }

}
```


3. 简洁的判断输出 foreach-object
```powershell
dir D:09PHP | where {$_.Length -gt 1mb} | ForEach-Object {$_.Name}
```
