do-while()会先执行再去判断，能保证循环至少执行一次。

1.一直循环，直到输入0,才停止循环

```powershell
do { $n=Read-Host } while( $n -ne 0)
```

2.递减输出
```powershell
$n=5

while($n -gt 0)
{

  $n

  $n=$n-1

}
```
输出结果

```
5
4
3
2
1
```

3.使用continue关键字，可是终止当前循环，跳过continue后其它语句，重新下一次循环。

```powershell
$n=1

while($n -lt 6)

{

   if($n -eq 4)

   {
   
     $n=$n+1

     continue

   }

   else

   {
   
    $n
   
   }

   $n=$n+1

}
```

输出结果

```
1
2
3
5
```


4.跳出循环语句使用break关键字

```powershell
$n=1

while($n -lt 6)

{

    if($n -eq 4)

    {
    
      break

    }

    $n

    $n++


}

```

输出结果

```
1
2
3
```