PEER-AS ROUTER CONFIGURATIONS FOR THIS NETWORK INCLUDE

>203.0.113.1 AS A PUBLIC IP ON G0/1
>192.168.10.0 255.255.255.252 LAN ON G0/1
>STATIC ROUTING
>TELNET
  
SECRETS

>ENABLE MODE :: tfg
>CONSOLE :: tfg
>TELNET :: tfg

&nbsp;  

```
enable
conf t
hostname PEER-AS
enable secret tfg

interface G0/0
ip address 203.0.113.1 255.255.255.0
no shutdown

interface G0/1
ip address 192.168.10.1 255.255.255.252
no shutdown

exit

line console 0
password tfg
login

line vty 0 4
password tfg
login
transport input telnet
transport output telnet

ip route 0.0.0.0 0.0.0.0 203.0.113.2

exit
wr
```