LAN ROUTERS CONFIGURATION FOR THIS NETWORK INCLUDE  

>192.168.ID.1 AS LAN GW ON INTERFACE G0/1  
>PPoE SERVER ASSIGNED CGNAT IP 100.64.0.2 ON INTERFACE G0/1  
>AS DHCP SERVER FOR LAN  
>STATIC ROUTING  
>TELNET  
>SSH  
  
SECRETS  

>ENABLE MODE :: tfg
>CONSOLE     :: tfg
>TELNET      :: tfg
>SSH         :: tfg
  
&nbsp;  
  
```
enable
conf t
hostname LAN1
enable secret tfg
no ip domain lookup

ip dhcp excluded-address 192.168.1.1
ip dhcp pool LANPOOL
network 192.168.1.0 255.255.255.0
default-router 192.168.1.1
dns-server 192.168.1.1

exit

service dhcp

interface g0/0
ip address 100.64.0.2 255.255.255.0
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

exit

interface g0/1
ip address 192.168.1.1 255.255.255.0
no shutdown

exit

ip route 0.0.0.0 0.0.0.0 100.64.0.1
ip route 192.168.2.0 255.255.255.0 100.64.0.3
ip route 192.168.3.0 255.255.255.0 100.64.0.4


exit
wr
```
