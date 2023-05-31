###  DISTRIBUTION MULTISWITCH CONFIGURATION

&nbsp; 

#### SECRETS  

> USERS                 :: admin/dist, SWDST/default
> ENABLE MODE           :: dist
> TELNET                :: telnetdist  
> SSH                   :: sshdist 
> COMMUNITY STRING R/O  :: distpublic
> COMMUNITY STRING W/R  :: distprivate


&nbsp;  

``` 
enable
conf t
hostname SW_DST
enable secret dist

interface f0/0
no switchport
ip address 10.10.11.1 255.255.255.252
no shutdown

interface f0/1
no switchport
ip address 10.10.9.1 255.255.255.252
no shutdown

interface f0/2
no switchport
ip address 10.10.12.1 255.255.255.252
no shutdown

interface f0/3
no switchport
ip address 10.10.14.1 255.255.255.252
no shutdown

interface f0/4
no switchport
ip address 203.0.113.129 255.255.255.128
no shutdown

interface f0/5
no switchport
ip address 10.0.5.1 255.255.255.252
no shutdown

exit

line vty 0 4
password telnetdist
login local
transport input telnet
transport output telnet

line vty 5
password sshdist
login local
transport input ssh
transport output ssh

exit

ip routing

router ospf 100
router-id 1.1.1.1

passive-interface f0/4
passive-interface f0/5

network 10.10.9.0 0.0.0.3 area 10
network 10.10.11.0 0.0.0.3 area 10
network 10.10.5.0 0.0.0.3 area 10
network 10.10.14.0 0.0.0.3 area 10
network 10.10.12.0 0.0.0.3 area 10
network 203.0.113.128 0.0.0.127 area 10

interface f0/0
ip ospf cost 20
ip ospf retransmit-interval 5
ip ospf priority 1
ip ospf hello-interval 20
ip ospf transmit-delay 5
ip ospf dead-interval 40

interface f0/1
ip ospf cost 20
ip ospf retransmit-interval 5
ip ospf priority 1
ip ospf hello-interval 20
ip ospf transmit-delay 5
ip ospf dead-interval 40

interface f0/2
ip ospf cost 20
ip ospf retransmit-interval 5
ip ospf priority 1
ip ospf hello-interval 20
ip ospf transmit-delay 5
ip ospf dead-interval 40

interface f0/3
ip ospf cost 20
ip ospf retransmit-interval 5
ip ospf priority 1
ip ospf hello-interval 20
ip ospf transmit-delay 5
ip ospf dead-interval 40

exit

ip access-list extended CGROUTE
permit icmp 203.0.113.128 0.0.0.127 any
permit ip 203.0.113.128 0.0.0.127 any
permit tcp 203.0.113.128 0.0.0.127 any
permit udp 203.0.113.128 0.0.0.127 any

route-map CGROUTING permit 10
match ip address CGROUTE
set ip next-hop 10.10.9.2

route-map CGROUTING permit 20
match ip address CGROUTE
set ip next-hop 10.10.9.2

route-map CGROUTING permit 30
match ip address CGROUTE
set ip next-hop 10.10.9.2

route-map CGROUTING permit 40
match ip address CGROUTE
set ip next-hop 10.10.9.2

interface f0/0
ip policy route-map CGROUTING 

interface f0/1
ip policy route-map CGROUTING 

exit
wr

```