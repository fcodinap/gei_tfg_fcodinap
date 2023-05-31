### PPPoE SERVER CONFIGURATION

&nbsp; 

#### SECRETS  

> USERS                 :: admin/pppoe, PPPOE1/default
> ENABLE MODE           :: pppoe
> TELNET                :: telnetpppoe  
> SSH                   :: sshpppoe 
> COMMUNITY STRING R/O  :: pppoepublic
> COMMUNITY STRING W/R  :: pppoeprivate


&nbsp;  

```  
enable
conf t

hostname PPPOE1
enable secret pppoe
no ip domain lookup

line vty 0 4
password telnetpppoe
login local
transport input telnet
transport output telnet

line vty 5
password sshpppoe
login local
transport input ssh
transport output ssh

exit

interface g0/0
ip address 10.10.12.2 255.255.255.252
duplex full
no shutdown

interface virtual-template 1
ip address 100.64.0.1 255.255.255.128
mtu 1492
peer default ip address dhcp-pool CLIENT
ppp authentication chap callin

ip dhcp pool CLIENT
network 100.64.0.0 /25
default-router 100.64.0.1
ip dhcp excluded-address 100.64.0.1


snmp-server community pppoepublic RO
snmp-server community pppoeprivate WR
snmp-server chassis-id PPPoE1_Router

username client password tfg
username admin password pppoe
username PPPOE1 password default

bba-group pppoe global
virtual-template 1

int g0/1
pppoe enable group global
no shutdown

interface g0/2
ip address 10.10.13.1 255.255.255.252
no shutdown

exit

router ospf 100
router-id 4.4.4.4
passive-interface g0/1

network 10.10.12.0 0.0.0.3 area 10
network 10.10.13.0 0.0.0.3 area 10
network 100.64.0.0 0.0.0.127 area 10

interface g0/0
ip ospf cost 20
ip ospf retransmit-interval 5
ip ospf priority 1
ip ospf hello-interval 20
ip ospf transmit-delay 5
ip ospf dead-interval 40

interface g0/2
ip ospf cost 20
ip ospf retransmit-interval 5
ip ospf priority 1
ip ospf hello-interval 20
ip ospf transmit-delay 5
ip ospf dead-interval 40

exit
exit

wr  
```  
