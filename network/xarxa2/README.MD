# Xarxa ISP 2   

---

![](C:\Users\Ungra\Documents\GitHub\gei_tfg_fcodinap\network\network1.2\network1.2.png)

---
**Versió:** *1.2*  


**Nom  :** *network1.2*  

---
**Descripció:**  

Aquesta xarxa no presenta molts de canvis respecte a la primera. No s'han afegit dispositius addicionals pero sí que s'han modificat les configuracions dels dispositius que ja es trobaven a la versió anterior. L'objectiu per aquesta xarxa és de que començar a implementar alguns mecanismes de seguretat com llistes de control d'accés així com de l'assignació d'adreces simulant un sistema de subscripció com ocorre en el model real mitjançant PPPoE. D'aquesta manera, les tecniques i eines emprades a les fases de l'auditoria donaran un resultat més semblant al que es podria obtenir en un entorn real. Addicionalment s'han afegit alguns protocols d'encaminament dinàmics, juntament amb l'adreçament estàtic del que ja es disposava. Addicionalemnt, i per a seguir creant un entorn més proper a la realitat, s'ha implementat el protocol d'encaminament BGP entre la porta d'accés a la xarxa de la ISP i la xarxa veina.

**Detalls:** 

- Aquesta xarxa no incorpora cap dispositiu addicional respecte la xarxa 1.1
- S'ha implementat un servidor PPPoE que assigna adreces als encaminadors clients de les LAN amb adreces de l'espai CGNAT 
- Els encaminadors NAT implementen DHCP per a les LAN
- S'implementa protocol d'encaminament BGP als encaminadors PEER-AS i BGP-AS, amb assinació d'ASN 22222 i 11111 respectivament
- Es realitza una traducció NAT a nivell d'accés (adreces privades --> adreces CGNAT)
- Amb la implementació de PPPoE ja hi ha limitacions de connectivitat entre les LAN

---
**Dispositius:**  

- **LnHn**: Dispositius connectats a les LAN.
- **ADV**: VM amb ParrotOS que simula l'adverasri.
- **LANn**: Encaminadors / Hubs de les LAN.
- **OLT**: Commutador que simula l'*Optic Line Terminal* de la ISP
- **PPPoE**: Encaminador intern de la capa d'accés. En aquesta topologia simplement actua com a GW de distribució
- **SW-DST**: Switch Multicapa. Cap utilitat en aquesta topologia.
- **BNG-AS**: *Edge Router* de la Xarxa, marca el límit de la xarxa interna amb l'exterior.
- **PPER-AS**: Simulació d'AS que connecta amb la ISP
