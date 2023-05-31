###  BGP NEIGHBOUR CONFIGURATION

&nbsp; 

#### SECRETS  

> USERS                 :: admin/peer, PEER/default
> ENABLE MODE           :: peer
> TELNET                :: telnetpeer
> SSH                   :: sshpeer
> COMMUNITY STRING R/O  :: peerpublic
> COMMUNITY STRING W/R  :: peerprivate


&nbsp;  

```
enable
conf t
hostname PEER-AS
enable secret peer

interface G0/0
ip address 203.0.114.1 255.255.255.128
no shutdown

interface G0/1
ip address 192.168.10.1 255.255.255.252
no shutdown

exit

line vty 0 4
password peer
transport input telnet
transport output telnet

line vty 5
password peer
transport input ssh
transport output ssh

exit

username admin secret peer
username PEER secret default

aaa new-model
aaa authentication login default local-case
aaa authorization exec default local if-authenticated
aaa authorization console

ip domain-name tfg.uoc
crypto key generate rsa
1024

router bgp 2222

bgp router-id 2.2.2.2
neighbor 203.0.114.2 remote-as 1111
address-family ipv4 unicast
network 192.168.10.0 mask 255.255.255.252

exit
exit

ip route 0.0.0.0 0.0.0.0 203.0.114.2

exit
wr

```