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

interface g0/0
ip address 100.64.0.3 255.255.255.0
no shutdown

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
# Select 1024
ip route 0.0.0.0 0.0.0.0 100.64.0.1
ip route 192.168.1.0 255.255.255.0 100.64.0.2
ip route 192.168.3.0 255.255.255.0 100.64.0.4

exit
wr
```
