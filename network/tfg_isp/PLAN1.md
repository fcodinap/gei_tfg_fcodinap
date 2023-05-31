### PUBLIC IP LAN ROUTER CONFIGURATION

&nbsp; 

#### SECRETS  

> USERS                 :: admin/admin, PLAN1/publicip
> ENABLE MODE           :: admin
> TELNET                :: publicip  
> SSH                   :: publicip 
> COMMUNITY STRING R/O  :: public
> COMMUNITY STRING W/R  :: private
  
&nbsp;  

#### CONFIGURATION 
  
```
enable
conf t

no ip domain lookup
hostname PLAN1
enable secret admin


line vty 0 4
password publicip
login local
transport input telnet
transport output telnet

line vty 5
password publicip
login local
transport input ssh
transport output ssh

interface g0/0
ip address 203.0.113.131 255.255.255.128
ip nat outside
no shutdown

interface g0/1
ip address 192.168.200.1 255.255.255.0
ip nat inside
no shutdown

exit

ip dhcp excluded-address 192.168.200.1
ip dhcp pool LANPOOL
network 192.168.200.0 255.255.255.0
default-router 192.168.200.1
dns-server 192.168.200.1

exit
service dhcp

username admin secret admin
username PLAN1 secret publicip


snmp-server community public RO
snmp-server community private WR
snmp-server chassis-id PLAN1_Router
snmp ifmib ifalias long


aaa new-model
aaa authentication login default local-case
aaa authorization exec default local if-authenticated
aaa authorization console

ip domain-name tfg_isp.uoc
crypto key generate rsa
1024

ip route 0.0.0.0 0.0.0.0 203.0.113.129

ip nat pool LANPOOL 192.168.200.1 192.168.200.254 netmask 255.255.255.0
access-list 1 permit 192.168.200.0 0.0.0.255
ip nat inside source list 1 interface g0/0

exit
wr
```
