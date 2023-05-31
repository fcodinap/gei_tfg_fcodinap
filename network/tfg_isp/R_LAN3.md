### LAN ROUTER CONFIGURATION

&nbsp; 

#### SECRETS  

> USERS                 :: admin/admin, LAN3/compromised
> ENABLE MODE           :: admin
> TELNET                :: compromised  
> SSH                   :: compromised 
> COMMUNITY STRING R/O  :: public
> COMMUNITY STRING W/R  :: private
> PPP                   :: client/tfg
  
&nbsp;  

#### CONFIGURATION 
  
```
enable
conf t

no ip domain lookup
hostname LAN3
enable secret admin


line vty 0 4
password compromised
login local
transport input telnet
transport output telnet

line vty 5
password compromised
login local
transport input ssh
transport output ssh

interface dialer 1
description Recieves PPPoE Configuration
mtu 1492
encapsulation ppp
ip address negotiated 
ppp chap hostname client
ppp chap password tfg
dialer pool 1
ip nat outside

no shutdown

interface g0/0
pppoe-client dial-pool-number 1
no shutdown

interface g0/1
ip address 192.168.3.1 255.255.255.0
ip nat inside
no shutdown

exit

ip dhcp excluded-address 192.168.3.1
ip dhcp pool LANPOOL
network 192.168.3.0 255.255.255.0
default-router 192.168.3.1
dns-server 192.168.3.1

exit
service dhcp

username admin secret admin
username LAN2 secret defaultWasChanged


snmp-server community public RO
snmp-server community private WR
snmp-server chassis-id Lan3_Router
snmp ifmib ifalias long


aaa new-model
aaa authentication login default local-case
aaa authorization exec default local if-authenticated
aaa authorization console

ip domain-name tfg_isp.uoc
crypto key generate rsa
1024

ip route 0.0.0.0 0.0.0.0 dialer 1

ip nat pool LANPOOL 192.168.3.1 192.168.3.254 netmask 255.255.255.0
access-list 1 permit 192.168.3.0 0.0.0.255
ip nat inside source list 1 interface dialer 1

access-list 100 permit icmp any any
access-list 100 permit tcp any any
access-list 100 permit ip any any

exit
wr
```
