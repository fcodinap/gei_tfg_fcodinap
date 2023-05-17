PPPoE CONFIGURATION FOR THIS NETWORK INCLUDE

>STATIC ROUTING
>TELNET
>SSH  
>PPPoE SERVICE
>SNMP
>OSPF Area 1
  
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
hostname PPPOE2
enable secret admin
no ip domain lookup

interface g0/0
ip address 10.0.1.6 255.255.255.252
duplex full
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

interface virtual-template 1
ip address 100.64.0.129 255.255.255.128
mtu 1492
peer default ip address dhcp-pool CLIENT
ppp authentication chap callin

ip dhcp pool CLIENT
network 100.64.0.128 /25
default-router 100.64.0.129

ip dhcp excluded-address 100.64.0.129

snmp-server community public RO
snmp-server community private WR
snmp-server chassis-id PPPoE2_Router

username client password tfg

bba-group pppoe global
virtual-template 1

int g0/1
pppoe enable group global

interface g0/2
ip address 10.0.1.10 255.255.255.252
no shutdown

exit

router ospf 100
router-id 4.4.4.4
passive-interface g0/1

network 10.0.1.4 0.0.0.3 area 10
network 10.0.1.8 0.0.0.3 area 10
network 100.64.0.128 0.0.0.127 area 10

interface g0/0
ip ospf cost 20
ip ospf retransmit-interval 20
ip ospf priority 1
ip ospf hello-interval 1
ip ospf transmit-delay 5
ip ospf dead-interval 3

interface g0/2
ip ospf cost 20
ip ospf retransmit-interval 20
ip ospf priority 1
ip ospf hello-interval 1
no ip ospf transmit-delay 5
ip ospf dead-interval 3

exit
wr  
```  