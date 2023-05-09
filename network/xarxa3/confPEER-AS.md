# PEER-AS ROUTER CONFIGURATIONS FOR THIS NETWORK INCLUDE

>203.0.113.129 255.255.255.128 AS A PUBLIC IP ON G0/0  
>192.168.10.1 255.255.255.252 INSIDE IP ADDRESS ON G0/1 
>STATIC ROUTING  
>TELNET  
>SSH
  
SECRETS  
  
>ENABLE MODE :: tfg  
>CONSOLE :: tfg  
>TELNET :: tfg  
>SSH :: tfg 
  
&nbsp;  
  
```
enable
conf t
hostname PEER-AS
enable secret tfg

interface G0/0
ip address 203.0.113.2 255.255.255.128
no shutdown

interface G0/1
ip address 192.168.10.1 255.255.255.252
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

router bgp 2222

bgp router-id 2.2.2.2
neighbor 203.0.113.1 remote-as 1111
address-family ipv4 unicast
network 192.168.10.0 mask 255.255.255.252

exit
exit
exit
wr

```