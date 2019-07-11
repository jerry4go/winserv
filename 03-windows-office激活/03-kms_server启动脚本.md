

`cp binaries/Linux/intel/static/vlmcsdmulti-x64-musl-static /usr/sbin/kms`

`#more /usr/lib/systemd/system/kms.service`

```
[Unit]
Description=kms
Wants=network.target
After=syslog.target

[Service]
Type=forking
PIDFile=/var/run/kms.pid
ExecStart=/usr/sbin/kms vlmcsd -l /var/log/kms.log -p /var/run/kms.pid
Restart=always

[Install]
WantedBy=multi-user.target
```

# 服务管理

systemctl daemon-reload

systemctl start kms

systemctl enable kms
