## Escaneig i ennumeració de xarxa amb NMAP
### Lloc Official Eina
- https://nmap.org/

--- 

### Descobriment de dispositius, enumeració de serveis i superfície exposada inicial

#### Requisitis  
- Accés a la xarxa des d'una LAN client de la ISP  
- Certs privilegis a la màquina atacant (l'execució d'algunes comandes de NMAP requereix d'aquests privilegis)  

Per entendre una mica el funcionament d'aquesta eina tant potent, una de les primeres coses que s'ha d'entendre és el de
la construcció de les comandes. Una comanda bàsica esta formada de la següent manera:

`nmap [tipus _escaneig] [opcions_escaneig] {objectiu}`

On   
`Tipus_escaneig:`  
Paràmetres que solen determinar els tipus, nombre i freqüencia de paquets o sondes que es generaran per realitzar l'escaneig.
Si no s'especifica cap tipus d'escaneig, NMAP realitzarà l'escaneig per defecte que inclou un paquet TCP amb la flag ACK
al port 80 així com un ICMP ECHO REQUEST a cada objectiu especificat.
`Opcions:`  
Paràmetres que especifiquen alguns valors a la comanda com objectius, ports, fitxers de sortida, precisió i d'altres. Algunes
de les opcions per defecte en cas de no especificar opcions són:
- Sortida per STDOUT  
- Primers 1000 ports de la llista de ports més habituals (veure llista ports NMAP)  
- Resultats bàsics sense anàlisi en profunditat  

`Objectius:`  
Mitjançant l'ús d'opcions o bé especificats de manera manual, pot acceptar diferents formats (notació CIDR o rangs .X-X per exemple)

A continuació es descriuen algunes de les comandes bàsiques que es poden utilitzar per al descobriment de la xarxa:

- Ping Sweep
--- 

#### Comanda: Ping Seep  
`nmap -sP <rang_adreces>`

#### Opcions i Paràmetres Especials  
`-l <usuari>:` login  
`-m <opcions> :` opcions específiques del mòdul  
`-P <wordlist>:` diccionari  
`-f:`  acabar cerca quan es trobi la primera clau vàlida

#### Execució  
A partir de la informació recopilada en fases anteriors es disposa d'un nom d'usuari *admin* i una clau d'accés *tfg*. 
Amb aquestes credencials podem accedir mitjançant un dels protocols d'accés remot al dispositiu. Construirem la comanda
d'aquest exemple amb els paràmetres necessaris, fent ús del modul d'Hydra **cisco-enable**.

`hydra -l admin -f -m tfg passdict.txt 100.64.0.2 cisco-enable`

![img_1.png](img_1.png)

Als resultats que proporciona Hydra es pot observar com s'ha trobat una clau vàlida que proporciona accés a mode privilegiat
i només caldrà connectar-se a través de telnet amb `telnet 100.64.0.2` accedir al dispositiu, entrar al mode privilegiat 
i introduir la clau trobada.

![img.png](img.png)

Rarament resultarà tant senzill, però d'assolir aquest nivell d'accés es podria dir que es te control gairebe complert 
sobre aquell domini de la xarxa i totes les funcions o serveis que el dispositiu pogués oferir.

---  
