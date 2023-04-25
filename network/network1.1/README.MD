# Xarxa ISP 1   

---

![](C:\Users\Ungra\Documents\GitHub\gei_tfg_fcodinap\network\network1.1\net1.png)

---
**Versió:** *1.0*  


**Nom  :** *network1.1*  

---
**Descripció:**  

- Aquesta primera xarxa s'ha dissenyat per poder posar a prova diferents técniques bàsiques d'escaneig, ennumeració i explotació. 

- No hi ha elements de seguretat implementats i tots els dispositius disposen de connectivitat amb la resta. 

- L'assignació d'adreces a nivell d'accés es realitza de manera estàtica  així com també l'encaminament, que s'ha 
realitzat de manera estàtica. 

- No s'incorporen traduccions NAT ni a nivell d'accés ni a nivell de distribució.

- L'equip des d'on es realitzaran les diferents proves es troba situat a la LAN 3, per tant l'accés a la xarxa es realitza 
de manera interna.

---
**Dispositius:**  

- **LnHn**: Dispositius connectats a les LAN.
- **ADV**: VM amb ParrotOS que simula l'adverasri.
- **LANn**: Encaminadors / Hubs de les LAN.
- **OLT**: Commutador que simula l'*Optic Line Terminal* de la ISP
- **PPPoE**: Encaminador intern de la capa d'accés. En aquesta topologia simplement actua com a GW de distribució
- **SW-DST**: Switch Multicapa. Cap utilitat en aquesta topologia.
- **BNG-AS**: *Edge Router* de la Xarxa, marca el límit de la xarxa interna amb l'exterior.
- **AS2**: *External Router*, utilitzat per connectar-hi dispositius i simular internet.