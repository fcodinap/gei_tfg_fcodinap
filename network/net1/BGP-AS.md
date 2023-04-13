# BNG-AS ROUTER CONFIGURATIONS FOR THIS NETWORK INCLUDE
  * 203.0.113.2 AS A PUBLIC IP ON G0/0
  * 10.0.0.1 255.255.255.252 MANAGEMENT IP ADDRESS ON G0/1 (*GSN3 ONLY ALLOWS FE PORTS)
  * STATIC ROUTING
  * TELNET
  
# SECRETS
  * ENABLE MODE :: tfg
  * CONSOLE :: tfg
  * TELNET :: tfg
  
```  
enable
conf t
hostname BNG_AS
enable secret tfg

interface G0/0
ip address 203.0.113.2 255.255.255.0
no shutdown

interface G0/1
ip address 10.0.0.1 255.255.255.252
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

ip route 0.0.0.0 0.0.0.0 203.0.113.1
ip route 100.64.0.0 255.255.255.0 10.0.0.2
ip route 10.0.0.0 255.255.255.0 10.0.0.2
ip route 192.168.0.0 255.255.0.0 10.0.0.2

exit
```  
  
