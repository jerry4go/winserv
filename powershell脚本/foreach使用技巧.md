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

```powershell
foreach($file in dir D:09PHP)

{

    if($file.Length -lt 1mb)

    {
    
        $file.Name

    }

}
```

输出 目录 D:09PHP 小于1mb的文件名

