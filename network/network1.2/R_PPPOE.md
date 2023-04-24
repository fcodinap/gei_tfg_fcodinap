PPPoE CONFIGURATION FOR THIS NETWORK INCLUDE

>STATIC 10.0.0.6 TO SW-DIST ON G0/0
>STATIC CGNAT IP 100.64.0.1 ON G0/1
>STATIC ROUTING
>TELNET
>SSH  
>PPPoE SERVICE
  
SECRETS  

>USERNAME    :: admin  
>ENABLE MODE :: tfg  
>CONSOLE     :: tfg  
>TELNET      :: tfg  
>SSH         :: tfg  
  
&nbsp;  

```  
enable
conf t
hostname PPPOE
enable secret tfg
no ip domain lookup

interface g0/0
ip address 10.0.0.6 255.255.255.252
no shutdown

exit

line vty 0 4
password tfg
login
transport input telnet
transport output telnet

line vty 5
password tfg
login
transport input ssh
transport output ssh

interface virtual-template 1
ip address 100.64.0.1 255.255.255.0
mtu 1492
peer default ip address dhcp-pool CLIENT
ppp authentication chap callin
no shutdown

ip dhcp pool CLIENT
network 100.64.0.0 /24
default-router 100.64.0.1

ip dhcp excluded-address 100.64.0.1

username client password tfg

bba-group pppoe global
virtual-template 1

int g0/1
pppoe enable group global
no shutdown

exit

ip route 0.0.0.0 0.0.0.0 10.0.0.5
ip route 192.168.1.0 255.255.255.0 100.64.0.2
ip route 192.168.2.0 255.255.255.0 100.64.0.3
ip route 192.168.3.0 255.255.255.0 100.64.0.4

exit
wr  
```  