###  BGP CONFIGURATION

&nbsp; 

#### SECRETS  

> USERS                 :: admin/bgp, BGP/default
> ENABLE MODE           :: bgp
> TELNET                :: telnetbgp  
> SSH                   :: sshbgp
> COMMUNITY STRING R/O  :: bgppublic
> COMMUNITY STRING W/R  :: bgpprivate


&nbsp;  

```  
enable
conf t
hostname BNG_AS
enable secret bgp

interface G0/0
ip address 203.0.114.2 255.255.255.128
no shutdown

interface G0/1
ip address 10.10.11.2 255.255.255.252
no shutdown

interface G0/2
ip address 10.10.8.1 255.255.255.252
no shutdown

exit

line vty 0 4
password telnetbgp
transport input telnet
transport output telnet

line vty 5
password sshbgp
transport input ssh
transport output ssh

exit

snmp-server community bgppublic RO
snmp-server community bgpprivate WR
snmp-server chassis-id BGP

username admin secret admin
username bgp password bgpadmin

aaa new-model
aaa authentication login default local-case
aaa authorization exec default local if-authenticated
aaa authorization console

ip domain-name tfg.uoc
crypto key generate rsa
1024

router bgp 1111

bgp router-id 1.1.1.1
neighbor 203.0.114.1 remote-as 2222
address-family ipv4 unicast
network 203.0.113.0 mask 255.255.255.0
network 203.0.113.128 mask 255.255.255.127

exit
exit

ip route 0.0.0.0 0.0.0.0 203.0.114.1
ip route 203.0.113.0 255.255.255.128 10.10.8.2
ip route 203.0.113.128 255.255.255.128 10.10.11.1

router ospf 100
router-id 2.2.2.2
passive-interface g0/0

network 10.10.8.0 0.0.0.3 area 10
network 10.10.11.0 0.0.0.3 area 10
network 203.0.114.0 0.0.0.255 area 10

interface g0/2
ip ospf cost 20
ip ospf retransmit-interval 5
ip ospf priority 1
ip ospf hello-interval 20
ip ospf transmit-delay 5
ip ospf dead-interval 40

interface g0/1
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
  
