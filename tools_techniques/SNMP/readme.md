## Obtenció i injecció d'informació a través de SNMP
### Onesixtyone(161), Snmpcheck i Metasploit SNMP Modules
- https://www.infosecmatter.com/metasploit-module-library/
- https://linux.die.net/man/1/snmpcheck
- https://linux.die.net/man/1/snmpwalk
- https://linux.die.net/man/1/snmpcmd
- https://github.com/trailofbits/onesixtyone

--- 

### Obtenció de community strings d'un dispositiu mitjançant OneSixtyOne

Per obtenir la informació d'un agent SNMP en primer lloc es necessitarà de les community strings corresponents, ja sigui 
amb privilegis RO o amb WR. Mitjançant una llista de community strings més habituals, es pot realitzar un atac de diccionari.

#### Requisitis  
- Dispositius amb SNMP a l'escolta(161)
- Diccionari de community strings

#### Arxius

Diccionari [strings_dict.txt](https://github.com/fuzzdb-project/fuzzdb/blob/master/wordlists-misc/wordlist-common-snmp-community-strings.txt)

#### Comandes

`onesixtyone -c <diccionari> <objectiu> -o <fitxer>`

#### Opcions i Paràmetres Especials  

`-c <wordlist>:` diccionari  
`-o <arxiu>:` arxiu amb l'output de l'escaneig   

#### Execució  

S'executa la comanda d'escaneig

`onesixtyone -c strings_dict.txt 100.64.0.1 -o snmp_scan.txt`  

Es neteja el resultat per obtenir una llsita de community string vàlides en cas de que s'hagin descobert

`sort snmp_scan.txt | uniq | awk '{print $1 " " $2}' | sed 's/[][]//g' > found_strings.txt `

S'obte una llista de strings trobades que es podran utilitzar més endavant.

> 100.64.0.1 private
> 100.64.0.1 public
  
>**Note**  
> L'obtenció d'aquiesta informació es pot realitzar també durant la fase d'escaneig a lea vegada que es realitza una
> enumeració de la xarxa

---  

### Obtenció de l'arbre MIB d'un dispositiu mitjançant Metasploit Snmp_enum module o snmp-check

Una vegada es disposa de community strings, mitjançant eines com snmpwalk és possible obtenir la informació sobre un dispositiu
en forma de dump complet del MIB, ja que aquest realitza un snmpget sobre tots els objectes del MIB. Ara bé, una manera
ràpida d'obtenir informació a partir de l'agent SNMP de manera clara i llegible és l'ús de snmp-check o el modul snmp-enum
de la llibreria de moduls de metasploit.

#### Requisitis  
- Dispositius amb SNMP(161) a l'escolta

#### Comandes

- Metasploit
  - `set RHOST <adreça>`
  - `set RPORT <port>`
  - `spool <path>`
  
- SNMP-Check
  - `snmp-check <opcions> -c <communitystring> <adreça>`

#### Opcions i Paràmetres Especials  

`RHOST:` objectiu/s    
`RPORT` port a utilitzar  
`-c:` community string  
`-w:` comprobar permisos d'escriptura  

#### Execució  

- Metasploit
Iniciem el modul de metasploit i establim variables necessaries abans d'executar. S'utilitza el modul spool per dirigir
la sortida de metasploit a un arxiu.

> use /auxiliary/scanner/snmp/snmp_enum  
> set RHOST 100.64.0.1  
> set RPORT 161  
>   
> spool /home/fcodinap/Desktop/tfg/EXPLO/snmp/ms_snmp_enum.txt  
> run   
  
- Snmp-check  
Executem la comanda i redirigim la sortida
`snmp-check -w -c public 100.64.0.1 > snmp_check.txt`

Ambdos eines retornaran pràcticament el mateix fitxer, on es podrà observar la configuració del dispositiu i del que es 
podrà extreure informació addicional. Si el que es desitja és realitzar un anàlisi més específic, es poden obtenir tots
els objectes del MIB mitjançant snmpwalk <OID> i/o utilitzant eines com [MIB Browser](https://www.ireasoning.com/mibbrowser.shtml)

> **Note**  
> Accions addicionals una vegada s'han descarregat els MIB i revisat les configuracions és la càrrega de fitxers de configuració 
> mitjançant tftp i SNMP. Per a fer-ho s'ha de disposar d'una community string amb permisos d'escriptura i
> s'utilitzarà el módul cisco_upload_file de metasploit per carregar aquesta informació al dispositiu.  
> 
> Aquest modul pero, no funcionarà correctament si s'executa darrera de NAT i per tant no s'ha contemplat realitzar un 
> exemple ja que no existeix un vector a la xarxa des d'on poder realitzar aquesta explotació. Tot i així aquesta és una
> eina que cal coneixer en cas de trobar-se en un entorn que fes viable la seva execució.  
> 
> Més informació sobre l'ús del modul a [Cisco IOS SNMP File Upload(TFTP)](https://www.infosecmatter.com/metasploit-module-library/?mm=auxiliary/scanner/snmp/cisco_upload_file)
---  

