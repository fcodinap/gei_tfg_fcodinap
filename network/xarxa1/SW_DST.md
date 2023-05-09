MULTILAYER SWITCH CONFIGURATION FOR THIS NETWORK INCLUDES

>10.0.0.5 255.255.255.252 MANAGEMENT IP ADDRESS ON F0/1 (*GSN3 ONLY ALLOWS FE PORTS)
>10.0.0.2 255.255.255.252 MANAGEMENT IP ADDRESS ON F0/0 (*GSN3 ONLY ALLOWS FE PORTS)
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
hostname SW_DST
enable secret tfg

interface f0/0
no switchport
ip address 10.0.0.2 255.255.255.252
no shutdown

interface f0/0
no switchport
ip address 10.0.0.5 255.255.255.252
no shutdown

exit

line console 0
password tfg
login

line vty 0 4
password tfg
login
transport input telnet

ip routing

ip route 0.0.0.0 0.0.0.0 10.0.0.1
ip route 100.64.0.0 255.255.255.0 10.0.0.6
ip route 192.168.0.0 255.255.0.0 10.0.0.6
ip route 192.168.10.0 255.255.255.0 10.0.0.1

exit
```