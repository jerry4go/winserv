```powershell
$n=10 

if ($n -eq 1) 

{"n=1"} 

elseif ($n -ne 1) 

{"n!=1,and n=$n"}
```

Êä³ö½á¹û

```
n!=1,and n=10
```

```powershell
If( $value -eq 1 )
{
    "Beijing"
}
Elseif( $value -eq 2)
{
    "Shanghai"
}
Elseif( $value -eq 3 )
{
    "Tianjin"
}
Else
{
    "Chongqing"
}
```