MULTILAYER SWITCH CONFIGURATION FOR THIS NETWORK INCLUDES

>10.0.0.5 255.255.255.252 MANAGEMENT IP ADDRESS ON F0/1 (*GSN3 ONLY ALLOWS FE PORTS)
>10.0.0.2 255.255.255.252 MANAGEMENT IP ADDRESS ON F0/0 (*GSN3 ONLY ALLOWS FE PORTS)
>STATIC ROUTING
>TELNET
>SSH
>SNMP
>OSPF Area 1
  
SECRETS

>USERNAME    :: admin
>ENABLE MODE :: tfg
>CONSOLE     :: tfg
>TELNET      :: tfg
>SSH         :: tfg
>COMMUNITY STRING R/O :: public
>COMMUNITY STRING W/R :: private

&nbsp;

```
enable
conf t
hostname SW_DST
enable secret tfg

interface f0/0
no switchport
ip address 10.0.0.2 255.255.255.252
no shutdown

interface f0/1
no switchport
ip address 10.0.0.5 255.255.255.252
no shutdown

interface f0/3
no switchport
ip address 10.0.0.17 255.255.255.252
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

ip routing

ip route 0.0.0.0 0.0.0.0 10.0.0.1
ip route 100.64.0.0 255.255.255.0 10.0.0.6
ip route 192.168.10.0 255.255.255.0 10.0.0.1

exit
wr

```