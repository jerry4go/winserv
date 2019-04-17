$servers='192.168.1.83','192.168.1.84'
$account='administrator'
$password='123456'
$site_name='WebSite'
$site_path='c:\WebSite'
$securestring=ConvertTo-SecureString -String $password -AsPlainText -Force
$start_website={
    Start-WebSite $args[0]
}
$stop_website={
    Stop-WebSite $args[0]
}
foreach($server in $servers){
    $credential=New-Object pscredential("$server\$account", $securestring)
    $session=New-PSSession -ComputerName $server -Credential $credential
    if( -not $? ) {
        "无法连接到服务器: $server"
        exit 1
    }
    Import-Module WebAdministration
    Invoke-Command -Session $session -ScriptBlock $stop_website -ArgumentList $site_name
    if( -not $? ) {
        "停止服务器$server上的站点失败"
        exit 1
    }
    ls "$ENV:WORKSPACE\WebMvc\bin\Release\PublishOutput\" | cp -Destination $site_path -ToSession $session -Recurse -Force
    if( -not $? ){
        "拷贝文件到服务器$server上失败"
        exit 1
    }
    Invoke-Command -Session $session -ScriptBlock $start_website -ArgumentList $site_name
    if( -not $? ){
        "启动服务器$server上的站点失败"
        exit 1
    }
    Remove-PSSession -Id $session.Id
}
exit 0