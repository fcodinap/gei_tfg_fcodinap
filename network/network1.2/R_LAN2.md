LAN ROUTERS CONFIGURATION FOR THIS NETWORK INCLUDE  

>192.168.ID.1 AS LAN GW ON INTERFACE G0/1  
>STATIC CGNAT IP 100.64.0.3 ON INTERFACE G0/1  
>STATIC ROUTING  
>TELNET  
  
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
hostname LAN2
enable secret tfg
no ip domain lookup

ip dhcp excluded-address 192.168.2.1
ip dhcp pool LANPOOL
network 192.168.2.0 255.255.255.0
default-router 192.168.2.1
dns-server 192.168.2.1

exit

service dhcp

interface g0/1
ip address 192.168.2.1 255.255.255.0
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

no shutdown

interface g0/0
pppoe-client dial-pool-number 1
no shut

ip route 0.0.0.0 0.0.0.0 100.64.0.1

exit
wr
```
