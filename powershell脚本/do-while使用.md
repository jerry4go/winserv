do-while()����ִ����ȥ�жϣ��ܱ�֤ѭ������ִ��һ�Ρ�

1.һֱѭ����ֱ������0,��ֹͣѭ��

```powershell
do { $n=Read-Host } while( $n -ne 0)
```

2.�ݼ����
```powershell
$n=5

while($n -gt 0)
{

  $n

  $n=$n-1

}
```
������

```
5
4
3
2
1
```

3.ʹ��continue�ؼ��֣�������ֹ��ǰѭ��������continue��������䣬������һ��ѭ����

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

������

```
1
2
3
5
```


4.����ѭ�����ʹ��break�ؼ���

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

������

```
1
2
3
```