PLAN ROUTERS CONFIGURATION FOR THIS NETWORK INCLUDE  

>192.168.ID.1 AS LAN GW ON INTERFACE G0/1  
>PUBLIC STATIC IP FROM AS POOL 203.0.113.129 ON INTERFACE G0/1  
>AS DHCP SERVER FOR LAN
>TELNET  
>SSH  
>OTHER SERVICES?
  
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
hostname PLAN1
enable secret tfg
no ip domain lookup

ip dhcp excluded-address 192.168.5.1
ip dhcp pool LANPOOL
network 192.168.5.0 255.255.255.0
default-router 192.168.5.1
dns-server 192.168.5.1

exit

service dhcp

interface g0/1
ip address 192.168.5.1 255.255.255.0
ip nat inside
no shutdown

interface g0/0
ip address 10.0.0.18 255.255.255.252
ip nat outside
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

exit

username admin secret tfg

ip domain-name tfg.uoc
crypto key generate rsa
1024

ip nat inside source static 192.168.5.2 203.0.113.129

access-list 110 permit icmp any any

ip route 0.0.0.0 0.0.0.0 10.0.0.17

exit
wr
```
