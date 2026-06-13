Collection of FreeBSD ports.

```
RELEASE 15
LOCALBASE /srv
```

```
# mkdir -p /usr/local/etc/pkg/repos/
# vim /usr/local/etc/pkg/repos/srvports.conf
srvports: {
  url: "http://pkg.chaosophia.net",
  enabled: yes
}
# pkg update
# pkg search srvports
```
