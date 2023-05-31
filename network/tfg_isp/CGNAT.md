###  CGNAT CONFIGURATION

&nbsp; 

#### SECRETS  

> USERS                 :: admin/cgnat, CGNAT/default
> ENABLE MODE           :: cgnat
> TELNET                :: telnetcgnat
> SSH                   :: sshcgnat
> COMMUNITY STRING R/O  :: cgnatpublic
> COMMUNITY STRING W/R  :: cgnatprivate


&nbsp;  

```
enable
conf t
hostname CGNAT
enable secret cgnat
no ip domain lookup

interface g0/0
ip address 10.10.8.2 255.255.255.252
ip nat outside
no shutdown

interface g0/1
ip address 10.10.9.2 255.255.255.252
ip nat inside
no shutdown

exit

line vty 0 4
password telnetcgnat
transport input telnet
transport output telnet

line vty 5
password sshcgnat
transport input ssh
transport output ssh

exit

snmp-server community cgnatpublic RO
snmp-server community cgnatprivate WR
snmp-server chassis-id cgnat_Router

username admin secret cgnat
username CGNAT secret default

aaa new-model
aaa authentication login default local-case
aaa authorization exec default local if-authenticated
aaa authorization console

ip domain-name tfg.uoc
crypto key generate rsa
1024

ip nat pool PUBPOOL 203.0.113.3 203.0.113.127 prefix-length 25
access-list 1 permit 100.64.0.0 0.0.0.255
ip nat inside source list 1 pool PUBPOOL

router ospf 100
router-id 3.3.3.3

network 10.10.8.0 0.0.0.3 area 10
network 10.10.9.0 0.0.0.3 area 10

interface g0/0
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
wr
```
