BNG-AS ROUTER CONFIGURATIONS FOR THIS NETWORK INCLUDE  
  
>203.0.113.1 255.255.255.128 AS A PUBLIC IP ON G0/0  
>10.0.0.1 255.255.255.252 MANAGEMENT IP ADDRESS ON G0/1 (*GSN3 ONLY ALLOWS FE PORTS)  
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
hostname BNG_AS
enable secret tfg

interface G0/0
ip address 203.0.113.1 255.255.255.128
no shutdown

interface G0/1
ip address 10.0.0.1 255.255.255.252
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

router bgp 1111

bgp router-id 1.1.1.1
neighbor 203.0.113.2 remote-as 2222
address-family ipv4 unicast
network 203.0.113.0 mask 255.255.255.128
network 100.64.0.0 mask 255.255.255.0

exit
exit

ip route 0.0.0.0 0.0.0.0 203.0.113.2
ip route 100.64.0.0 255.255.255.0 10.0.0.2

exit
wr

```  
  
