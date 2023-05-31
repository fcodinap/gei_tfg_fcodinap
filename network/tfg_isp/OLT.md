OLT SWITCH CONFIGURATION FOR THIS NETWORK INCLUDES

>TELNET
>SSH
  
SECRETS  

>USERNAME    :: admin  
>ENABLE MODE :: admin  
>CONSOLE     :: admin  
>TELNET      :: admin  
>SSH         :: admin  
  
&nbsp;  

#### CONFIGURATION
 
```
enable
conf t
hostname OLT
enable secret admin
  
line vty 0 4
password admin
transport input telnet
transport output telnet

line vty 5
password tfg
transport input ssh
transport output ssh

exit
  
exit
wr

```
  
