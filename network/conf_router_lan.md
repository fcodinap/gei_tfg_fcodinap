## Configuració Routers LAN usuaris.  
### **Important:** Utilitzar els mateixos ports que es mostren a la topologia

---  

#### Configuració interfícies i DHCP Server
  
---  

  
  
  
conf t  
hostname LAN#  
interface g0/1  
ip address 192.168.0.1 255.255.255.0  
no shutdown  
exit  
ip dhcp exclude-address 192.168.0.1 192.168.0.3  
ip dhcp pool lan1  
network 192.168.0.0 255.255.255.0  
default-router 192.168.0.1  
dns-server 192.168.0.1  
end  
wr  
