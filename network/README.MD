
## Adreçament

### Public IPs

Per a les adreces públiques s'utilitzarà el rang d'adreces reservat per a documentació descrit a [RFC5737](https://www.rfc-editor.org/rfc/rfc5737.html).  
D'aquesta manera s'observarà una distinció entre els espais NAT / CGNAT / PUBLIC.

Per a la simulació, la AS de la ISP tindrà assignades 16 adreces consecutives del rang 203.0.113.0/24 :

*Inicialment treballarem amb les 3 primeres: .113.1-3*  
**{ 203.0.113.1 - 203.0.113.16 }**

---  

### CG-NAT IPs

Per a la pool de CGNAT s'utilitzarà el rang d'adreces descrit a [RFC6598](https://www.rfc-editor.org/rfc/rfc6598.html) reservat per aquest proposit. La pool
inicial serà tot el bloc de 100.64.0.0/10, tot i que segurament s'acabi limitant a una pool 100.64.0.0/24 de per facilitar a l'hora de documentar l'apartat de la xarxa 
al llarg de l'auditoria, ja que tampoc seran necessàries tantes adreces i haurem de limitar-ho quan es provi de saturar el router que realitza la traducció :

**{ 100.64.0.1 - 100.64.0.254 }**

---  

### End Point Peer LAN NATs i ISP Private Network LAN

Per a les xarxes locals dels endpoints s'utilitzaran adreces dels blocs 192.168.0.0/16 i 172.16.0.0/12, intentant utilitzar de manera eficient els espais d'adreces. Per a
la xarxa de la ISP (empleats, comptabilitat, etc..) s'utilitzarà el rang d'adreces 10.0.0.0/24 per poder diferenciar-lo de la resta.

---  
