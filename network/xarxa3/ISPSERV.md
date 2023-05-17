ISPSERV ROUTER CONFIGURATIONS FOR THIS NETWORK INCLUDE  


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
hostname ISPSERV
enable secret admin
no ip domain lookup

interface g0/0
ip address 10.0.100.2 255.255.255.252
ip nat outside
no shutdown

interface g0/1
ip address 192.168.100.1 255.255.255.0
ip nat inside
no shutdown

exit

line vty 0 4
password tfg
transport input telnet
transport output telnet

line vty 5
password tfg
transport input ssh
transport output ssh

exit

snmp-server community public RO
snmp-server community private WR
snmp-server chassis-id ISPSERV

username admin secret admin

ip nat inside source static 192.168.100.2 203.0.113.130
access-list 1 permit 192.168.100.0 0.0.0.255

ip route 0.0.0.0 0.0.0.0 10.0.100.1

exit
wr
```


