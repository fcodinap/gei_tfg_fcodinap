OLT SWITCH CONFIGURATION FOR THIS NETWORK INCLUDES

>TELNET
>SSH
  
SECRETS  

>USERNAME    :: admin  
>ENABLE MODE :: tfg  
>CONSOLE     :: tfg  
>TELNET      :: tfg  
>SSH         :: tfg  
  
&nbsp;
  
```
enable
conf t
hostname OLT
enable secret tfg
  
line vty 0 4
password tfg
login
transport input telnet
transport output telnet

line vty 5
password tfg
login
transport input ssh
transport output ssh

exit
  
exit
wr

```
  
