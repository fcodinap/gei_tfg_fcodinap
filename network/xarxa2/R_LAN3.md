LAN ROUTERS CONFIGURATION FOR THIS NETWORK INCLUDE  

>192.168.ID.1 AS LAN GW ON INTERFACE G0/1  
>PPoE SERVER ASSIGNED CGNAT IP 100.64.0.2 ON INTERFACE G0/1  
>AS DHCP SERVER FOR LAN  
>STATIC ROUTING  
>TELNET  
>SSH  
  
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
hostname LAN3
enable secret tfg
no ip domain lookup

ip dhcp excluded-address 192.168.3.1
ip dhcp pool LANPOOL
network 192.168.3.0 255.255.255.0
default-router 192.168.3.1
dns-server 192.168.3.1

exit

service dhcp

interface g0/1
ip address 192.168.3.1 255.255.255.0
ip nat inside
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

aaa new-model
aaa authentication login default local-case
aaa authorization exec default local if-authenticated
aaa authorization console

ip domain-name tfg.uoc
crypto key generate rsa
1024

interface dialer 1
mtu 1492
encapsulation ppp
ip address negotiated 
ppp chap hostname client
ppp chap password tfg
dialer pool 1
ip nat outside

no shutdown

interface g0/0
pppoe-client dial-pool-number 1

exit

ip nat pool LANPOOL 192.168.3.1 192.168.3.254 netmask 255.255.255.0
access-list 1 permit 192.168.3.0 0.0.0.255
ip nat inside source list 1 interface dialer 1

access-list 110 permit icmp any any
access-list 110 permit tcp any any
access-list 110 permit ip any any

ip route 0.0.0.0 0.0.0.0 100.64.0.1

exit
wr
```
