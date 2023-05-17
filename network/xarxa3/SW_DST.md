MULTILAYER SWITCH CONFIGURATION FOR THIS NETWORK INCLUDES

>TELNET
>SSH
>SNMP
>OSPF Area 1
>POLICY BASED ROUTING(PBR) SO THAT PUBLIC ADRESSES DO NOT GO TO CGNAT ROUTER
>NEED TO SOLVE SOME ACCESS LIST ISSUES
  
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
hostname SW_DST
enable secret admin

interface f0/0
no switchport
ip address 10.0.0.2 255.255.255.252
no shutdown

interface f0/1
no switchport
ip address 10.0.1.1 255.255.255.252
no shutdown

interface f0/2
no switchport
ip address 10.0.0.9 255.255.255.252
no shutdown

interface f0/3
no switchport
ip address 10.0.1.5 255.255.255.252
no shutdown

interface f0/5
no switchport
ip address 10.0.100.1 255.255.255.252
no shutdown

interface f0/6
no switchport
ip address 10.0.200.1 255.255.255.252
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

ip routing

router ospf 100
router-id 1.1.1.1

passive-interface f0/6
passive-interface f0/5
passive-interface f0/4

network 10.0.0.0 0.0.0.3 area 10
network 10.0.0.8 0.0.0.3 area 10
network 10.0.1.0 0.0.0.3 area 10
network 10.0.1.4 0.0.0.3 area 10
network 203.0.113.128 0.0.0.128 area 10
network 10.0.100.0 0.0.0.3 area 10

interface f0/0
ip ospf cost 500
ip ospf retransmit-interval 5
ip ospf priority 1
ip ospf hello-interval 5
ip ospf transmit-delay 5
ip ospf dead-interval 5

interface f0/1
ip ospf cost 20
ip ospf retransmit-interval 5
ip ospf priority 1
ip ospf hello-interval 5
ip ospf transmit-delay 5
ip ospf dead-interval 5

interface f0/2
ip ospf cost 20
ip ospf retransmit-interval 5
ip ospf priority 1
ip ospf hello-interval 5
ip ospf transmit-delay 5
ip ospf dead-interval 5

interface f0/3
ip ospf cost 20
ip ospf retransmit-interval 5
ip ospf priority 1
ip ospf hello-interval 5
ip ospf transmit-delay 5
ip ospf dead-interval 5

ip access-list extended CGROUTE
permit icmp 203.0.113.128 0.0.0.127 any
permit ip 203.0.113.128 0.0.0.127 any
permit tcp 203.0.113.128 0.0.0.127 any
permit udp 203.0.113.128 0.0.0.127 any

route-map CGROUTING permit 10
match ip address CGROUTE
set ip next-hop 10.0.0.1

route-map CGROUTING permit 20
match ip address CGROUTE
set ip next-hop 10.0.0.1

route-map CGROUTING permit 30
match ip address CGROUTE
set ip next-hop 10.0.0.1

route-map CGROUTING permit 40
match ip address CGROUTE
set ip next-hop 10.0.0.1

interface f0/1
ip policy route-map CGROUTING 

interface f0/3
ip policy route-map CGROUTING 

exit
wr

```