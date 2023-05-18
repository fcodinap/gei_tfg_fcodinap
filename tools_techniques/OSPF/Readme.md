## Atacs a IGPs
  
### Open Shortest Path First (OSPF)

####  Breu Resum d'OSPF

OSPF és un protocol d'encaminament intern que es basa en els paràmetres i estat dels enllaços (Link State Routing) que
uneixen els diferents dispositius que l'implementen i que comparteixen rutes d'encaminament entre ells. Entre tots els
elements que formen el conjunt del protocol n'hi alguns que cal coneixer en profunditat per entendre com es pot arribar
a atacar aquest protocol:

- **Àrea OSPF**   
Es tracta de l'area o domini per a la qual es cercaran i s'emmagatzemaran rutes d'encaminament. No es disposarà a les taules 
d'encaminament informació sobre la ruta a un dispositiu fora del domini d'aquesta.
- **Taules OSPF**
  - **Taula de veïns:** Conte una llsita de tots aquells veïns que formen part de l'àrea OSPF
  - **Taula d'encaminament:** Conte una llista del millor camí cap a cada xarxa o subdomini conegut al que es pot accedir a l'àrea
- **Paquets OSPF**
  - **Hello:** Utilitzats quan es vol establir connexió amb possibles veïns que formin part de l'àrea
  - **Link State Request:** Solicitud d'infromació a un veí per a l'obtenció de les seves taules d'encaminament o la base de dades
  - **Link State Update:** Resposta a un veí que solicita actualització de dades
  - **Link State Acknowledgement:** Resposta a l'obtenció de dades d'un veí (similar als ACK que es poden observar en el protocol TCP)  
- **Classificació dels dispositius en una àrea**
  - **DR** (Designated Router)
  - **BDR** (Backup Designated Router)

- **Formació d'adjacencies i compartició de dades**  
  - Els encaminadors que implementen OSPF envien un paquet HELLO per totes les interfícies (broadcast excepte interfícies
  passives, veure més endavant), pqaquet que inclou diferents paràmetres i conmfiguracions del protocol.
  - Una vegada formades les adjacencies, s'intercanvien les bases de dades, amb prioritat per a les que pertanyen al
  dispositiu amb més prioritat (configurada manualment o en el seu defecte per ID del dispositiu)
  - Es comparen les bases de dades rebudes amb la propia i s'envien solicituds per aquelles xarxes per a les quals no es
  disposa de camí.
  - Es respon a solicituds i s'accepten respostes a aquestes.

- **Tipus d'enllaç**
  - Interfície Activa: Els missatges anteriors s'enviaran per aquestes.
  - Interfície Passiva: Els paquets OSPF no s'enviaran per aquestes.

Aquest protocol, així com d'altres protocols de la família IGP són de vital importància en xarxes de certa complexitat o 
extensió com és el cas de la xarxa d'una ISP, ja que l'ús de CGNAT així com l'assignació dinàmica d'adreces i la gran
quantitat d'aquestes que s'han de gestionar fan iviable la gestió d'encaminament mitjançat rutes estàtiques.

Amb tot aixó, OSPF és un protocol de certa complexitat i per poder ser explotat requereix de l'existencia de certs requisits
previs, requisits que moltes vegades es poden complir degut a la manca de rigorositat a l'hora de configurar els diferents
dispositius per part dels responsables de la xarxa. A continuació es descriuen alguns dels atacs que es poden dur a terme 
en una xarxa que implementi OSPF.

> **Note**  
> Per a exemplificar d'una manera propera a la realitat aquests atacs resulta vital l'ús d'eines que simulin un encaminador
> fals, des d'on executar els atacs com per exemple paquets de protocols d'encaminament per simular dispotius com FRR o Bird
> entre d'altres (veure Routing Suites) així com eines de fabricació de paquets com [Scapy](https://scapy.net/).
> 
> Degut a la complexitat d'aquestes eines s'han simplificat aquestes i es farà ús directament d'un encaminador que simularà
> l´ús d'aquestes eines com si de la màquina atacant es tractés. En treballs futurs es contempla l'estudi, posada en marxa
> i pràctica en GSN3 d'aquestes eines .

--- 

### Injecció de Rutes i captura de trànsit (MiTM)


#### Requisitis  


#### Comandes a dispositius cisco  
  

#### Execució  


--- 

### Desbordament de Taules d'encaminament (DoS)


#### Requisitis  


#### Comandes a dispositius cisco  
  

#### Execució  


--- 

### Ennumeració de Xarxa Avançada (augment de superfície exposada)


#### Requisitis  


#### Comandes a dispositius cisco  
  

#### Execució  


--- 