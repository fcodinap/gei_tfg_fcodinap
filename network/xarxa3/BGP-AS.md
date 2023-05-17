BNG-AS ROUTER CONFIGURATIONS FOR THIS NETWORK INCLUDE  
   
>BGP ROUTING  
>TELNET  
>SSH
>SNMP
>OSPF Area 1
  
SECRETS  
  
>ENABLE MODE :: admin  
>CONSOLE :: admin  
>TELNET :: admin  
>SSH :: admin
>COMMUNITY STRING R/O :: public
>COMMUNITY STRING W/R :: private
  
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

interface G0/2
ip address 10.0.0.13 255.255.255.252
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
snmp-server chassis-id BGP

username admin secret admin

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
network 203.0.113.0 mask 255.255.255.0
network 203.0.113.128 mask 255.255.255.127

exit
exit

ip route 0.0.0.0 0.0.0.0 203.0.113.2
no ip route 100.64.0.0 255.255.255.0 10.0.0.14
ip route 203.0.113.0 255.255.255.128 10.0.0.14

router ospf 100
router-id 2.2.2.2
passive-interface g0/0

network 10.0.0.12 0.0.0.3 area 10
network 10.0.0.0 0.0.0.3 area 10
network 203.0.113.0 0.0.0.255 area 10

interface g0/2
ip ospf cost 20
ip ospf retransmit-interval 5
ip ospf priority 1
ip ospf hello-interval 5
ip ospf transmit-delay 5
ip ospf dead-interval 5

interface g0/1
ip ospf cost 20
ip ospf retransmit-interval 5
ip ospf priority 1
ip ospf hello-interval 5
ip ospf transmit-delay 5
ip ospf dead-interval 5

exit
wr

```  
  
