OLT SWITCH CONFIGURATION FOR THIS NETWORK INCLUDES

>TELNET
>SSH
  
SECRETS  

>USERNAME    :: admin  
>ENABLE MODE :: tfg  
>CONSOLE     :: tfg  
>TELNET      :: tfg   
  
&nbsp;
  
``` 
enable
conf t
hostname OLT
enable secret tfg
  
line console 0
password tfg
login

line vty 0 4
password tfg
login
transport input telnet
transport output telnet
  
exit
```
  
