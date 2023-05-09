PPPoE CONFIGURATION FOR THIS NETWORK INCLUDE
>STATIC 10.0.0.6 TO SW-DIST ON G0/0
>STATIC CGNAT IP 100.64.0.1 ON G0/1
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
hostname PPPOE
enable secret tfg
no ip domain lookup

interface g0/0
ip address 10.0.0.6 255.255.255.252
no shutdown

interface g0/1
ip address 100.64.0.1 255.255.255.0
no shutdown

exit

line console 0
password tfg
login

line vty 0 4
password tfg
login
transport input telnet

exit

ip route 0.0.0.0 0.0.0.0 10.0.0.5
ip route 192.168.1.0 255.255.255.0 100.64.0.2
ip route 192.168.2.0 255.255.255.0 100.64.0.3
ip route 192.168.3.0 255.255.255.0 100.64.0.4

exit
wr
```
