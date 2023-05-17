PLAN ROUTERS CONFIGURATION FOR THIS NETWORK INCLUDE  

>AS DHCP SERVER FOR LAN
>TELNET  
>SSH  
>SNMP
>ON STANDBY, ONLY USED FOR CERTAIN EXAMPLES
  
SECRETS  

>USERNAME    :: admin  
>ENABLE MODE :: admin  
>CONSOLE     :: admin  
>TELNET      :: admin  
>SSH         :: admin  
>COMMUNITY STRING R/O :: public
>COMMUNITY STRING W/R :: private

&nbsp;  
  
```
enable
conf t
hostname PLAN1
enable secret tfg
no ip domain lookup

ip dhcp excluded-address 192.168.200.1
ip dhcp pool LANPOOL
network 192.168.200.0 255.255.255.0
default-router 192.168.200.1
dns-server 192.168.200.1

exit

service dhcp

interface g0/1
ip address 192.168.200.1 255.255.255.0
ip nat inside
no shutdown

interface g0/0
ip address 10.0.200.2 255.255.255.252
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

snmp-server community public RO
snmp-server community private WR
snmp-server chassis-id PLan1_Router

username admin secret tfg

ip domain-name tfg.uoc
crypto key generate rsa
1024

ip nat inside source static 192.168.200.2 203.0.113.129

access-list 110 permit icmp any any

ip route 0.0.0.0 0.0.0.0 10.0.200.1

exit
wr
```
