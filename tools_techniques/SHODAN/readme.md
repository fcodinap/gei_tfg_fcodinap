## Shodan Search Engine

### Recopilació d'informació, escaneig i enumeració amb SHODAN Search Engine

Una eina realment potent a l’hora de recopilar informació sobre una ISP que serà de molta utilitat és Shodan Search Engine . 
Aquest cercador es una eina que es centra en l’escaneig d’internet a nivell mundial de dispositius connectats a aquesta 
normalment de manera setmanal. Ho realitza mitjançant l’enumeració de ports oberts i en el cas de que la ISP disposi d’algun
element a la xarxa obert de manera pública serà possible trobar informació sobre aquest dispositiu que ens serveixi per 
localitzar possibles punts d’accés a la xarxa. Aquesta informació es combina juntament amb la informació que es pot obtenir 
de les bases de dades dels RIR, obtenint informes complerts sobre aquell dispositiu en qüestió.

La cerca es pot realitzar tant per nom de la organització (molts dispositius tenen un camp que identifiquen el seu propietari)
com per adreça IP (de les que ja s’ha obtingut amb anterioritat). A banda d’aquestes cerques individuals, SHODAN disposa 
de moltes eines que es poden utilitzar per a millorar la qualitat de l’OSINT que es vol obtenir. A continuació es detallen 
algunes d’aquestes eines que podran resultar útils per al procés que s’està duent a terme. Cal notar que algunes eines 
oferiran millors resultats si es disposa d’una subscripció. Per a aquest treball s’ha utilitzat una subscripció gratuïta 
per a estudiants, l’Academic membership, de la que s’ha pogut disposar per pertànyer a la universitat.

- NETWORK MONITORING  
Tal i com s’ha comentat, la informació que s’obté amb les cerques a SHODAN és la que s’actualitza amb l’escaneig que realitzen 
setmanalment. Tot i que acurada, és possible obtenir informació més recent i actualitzada en cas de creure-ho necessari 
mitjançant un escaneig actiu. Aquest escaneig es podria considerar més com una part de la següent fase que no pas de la 
recopilació d’informació. En el cas d’utilitzar un compte acadèmic, es permet el monitoratge de fins a 16 IP de manera 
simultània.


- MAPS  
Tot i que no amb una precisió molt gran, si que és possible situar físicament en un mapa els dispositius que  es trobin 
amb una cerca. Aquest punt ajudarà a identificar les possibles localitzacions des d’on realitzar un accés a la xarxa. 
Per exemple, si un bar, restaurant o hotel disposa d’internet per als seus clients, l’atacant es podria desplaçar a la 
localització i connectar-se a la xarxa de la ISP a través d’aquests punts d’accés.


- IMATGES  
En alguns casos, aquests dispositius que s’han cercat són càmeres IP. SHODAN ofereix amb aquesta cerca una imatge obtinguda 
d’aquest dispositiu i la informació que es pugui obtenir d’aquest pot ajudar a identificar el punt d’accés per exemple.


- DEVELOPER  
SHODAN posa a disposició dels usuaris una API i llibreries per a molts llenguatges en el cas de que es vulgui automatitzar 
algun tipus de cerca o obtenir certs resultats mitjançant la creació pròpia de scripts o programari que faci crida als 
serveis que SHODAN ofereix.


Una vegada realitzada aquesta cerca, i en el millor dels casos, ja es disposarà de possibles dispositius i localitzacions 
d’aquests. Així mateix amb la informació obtinguda es podran realitzar escaneigs i enumeracions més precisos a la següent 
fase. Per altra banda s’hauran pogut identificar el tipus de models de dispositius que utilitza la ISP, informació que 
s’ampliarà a la següent fase i ens servirà també de cara a l’anàlisi de vulnerabilitats. De la mateixa manera que amb d’altres 
eines, SHODAN disposa de la API anteriorment mencionada que es pot utilitzar per realitzar crides a la seva base de dades 
mitjançant la pròpia línia de comandes i sense necessitat d’un navegador web. Es pot trobar més informació al respecte a 
Shodan CLI API i algunes eines com ASN que es descriu a l'apartat de Lookups és un exemple d'eina que fa ús d'aquesta API.

---

### Scripts amb Python i Shodan API

Un dels molts llenguatges suportats per la API de Shodan és Python, llenguatge que es pot veure utilitzat en d'altres eines
i tecniques mencionades en aquest treball com Scapy. La instalació de la llibreria és senzilla `pip install shodan` i només
caldrà revisar la [documentació](https://shodan.readthedocs.io/en/latest/) de la API per poder iniciar-se en el seu ús i 
començar a crear programes per a l'obtenció d'informació i l'ennumeració de xarxes. A continuació es descriu la creació d'un
programa senzill que cerca adreces IP d'un objectiu donat el seu nom o un rang d'adreces i que es pot trobar a l'arxiu 
exemple_shodan_api.py

S'estableix la clau necessaria per a la utilització de la API. Aquesta es pot trobar a la informació del compte d'usuari a Shodan

> API_KEY = 'substituir_per_api_key'  

Configuració de la API, i construcció de la consulta
> api = shodan.Shodan(API_KEY)  
> 
> query = ' '.join(sys.argv[1:])  

Realització de la consulta, emmagatzematge del retorn i mostra per pantalla del resultat filtrat per IP

> result = api.search(query)  

> for service in result['matches']:  
>     print(service['ip_str'])  


La captura del seu ús seria la següent, on s'indica un nom com a argument a passar al programa.

`./exemple_shodan_api.py 'XXXXX_XXXXX'`

> XXX.95.148.XXX  
> XXX.95.148.XXX  
> XXX.125.96.XXX  
> XXX.95.148.XXX  
> XXX.95.148.XXX  
> [ ... ]   


Les possibilitats amb la API de Shodan són molt grans, i amb experiencia i temps es poden arribar a desenvolupar eines de
fabricació propia que s'adaptin a les encessitats de cada objectiu. A banda de la creació de programes personalitzsats, 
existeixen a internet multitud d'eines que utilitzen la API, sent un dels casos ASN, descrita a l'apartat de Lookups.

---  

### Shodan des de la CLI

A banda de la creació de Scripts propis o la realització de consultes mitjançant un navegador web, existeix la possibilitat
d'utilitzar Shodan com una eina més des de la linia de comandes. Aquest métode pot arribar a ser el més útil en cas de que
ja s'estigui treballant des de la CLI amb algun altre framework, de cara a simplificar l'entorn de treball del pentest.

S'inicia amb la clau de l'API de l'usuari  

`shodan init $APIK`

Es realitza una cerca amb `search` o amb `download` seguida per el valor que es vol cercar, en aquest cas en forma de nom, 
pero pot realitzar-se com en qualsevol altra cerca ja sigui per adreça, per prefixe o per ASN.  

`shodan search 'XXXXX_XXXXX' | awk '{print $1 " " $2}'`

S'han filtrat els resultats per obtenir host(1ª col) i port(2ª col) per obtenir una ennumeració bàsica.

> XXX.95.148.XXX 161  
> XXX.95.148.XXX 161  
> XXX.125.96.XXX 161  
> XXX.95.148.XXX 161  
> XXX.95.148.XXX 161  
> [ ... ]

Les possibilitats de nou són molt grans i l'éxit en dependrà de l'exepriencia amb l'eina i el coneixement de les dades que
es poden arribar a obtenir d'una base de dades com la de Shodna. per a més opcions es pot utilitzar la comanda `shodan -h`.

--- 

Les 3 opcions amb les que es pot interactuar amb Shodan i la versatilitat que presenta fan d'aquesta eina una d'indispensable
a l'hora de dur a terme reconeixements en un pentest, sobretot si aquests s'estan realitzant sobre una ISP ja que com es veu al
llarg del treball, la majoria de problemes en seguretat de la xarxa d'una ISP vindran donats per la visibilitat dels encaminadors
i els seus serveis així com la configuració que se n'hagi realitzat. Ara bé, aquesta presenta un cost que per a escaneijos
de gran magnitud o aleatoris fa que no sigui una eina economica.