# Notes sobre les Xarxes del treball  
  
- ## Adreçament Utilitzat

---

- ### Public IPs  
`203.0.113.0/25 - 203.0.113.128/25`

- Per a les adreces públiques s'utilitzarà el rang d'adreces reservat per a documentació descrit a [RFC5737](https://www.rfc-editor.org/rfc/rfc5737.html).  
  D'aquesta manera s'observarà una distinció entre els espais NAT / CGNAT / PUBLIC.
- La AS de la ISP tindrà assignades el bloc *203.0.113.0/25*  
- La resta d'adreces públiques utilitzaran el bloc *203.0.113.10.128/25* 
  
&nbsp;  

- ### CG-NAT IPs  
`100.64.0.0/10`

- Per a la pool de CGNAT s'utilitzarà el rang d'adreces descrit a [RFC6598](https://www.rfc-editor.org/rfc/rfc6598.html) reservat per aquest proposit. 
- La pool inicial serà tot el bloc de *100.64.0.0/10*, tot i que segurament s'acabi limitant a una pool 100.64.0.0/24 de per facilitar a l'hora de documentar l'apartat de la xarxa  al llarg de l'auditoria, ja que tampoc seran necessàries tantes adreces i haurem de limitar-ho quan es provi de saturar el router que realitza la traducció.
  
&nbsp;  
   
- ### LANS i altres privades   
`192.168.0.0/16 - 172.16.0.0/12 - 10.0.0.0/8`

- Per a les xarxes locals dels endpoints s'utilitzaran adreces dels blocs *192.168.0.0/16* i *172.16.0.0/12*, intentant utilitzar de manera eficient els espais d'adreces.  
- Per a la xarxa de la ISP (interfícies de gestió) s'utilitzarà el rang d'adreces *10.0.0.0/8* per poder diferenciar-lo de la resta.

&nbsp;  
   
- ## Projectes de GSN3 i Dispositius

---

- Per a importar correctament les xarxes a GSN3 s'ha de copiar el projecte amb la xarxa al directori de projectes de GSN3 o hi haurà problemes amb els paths.  
- S'ha de disposar de tots els dispositius a virtualitzar ja creats a GSN3 (veure llista de dispositius).  
- És possible que s'hagin de configurar manualment les interfícies de les MV's *Adversary* o *Victim*. Es pot utilitzar qualsevol MV per ocupar el lloc de la que es descriu a la xarxa.  
- Les MV's no es poden iniciar amb adaptador de xarxa en *NAT*. Veure més a l'apartat *entorn* de la memoria.  
- Seguir la resta d'instruccions per el correcte *import* dels projectes.  
- Les comandes de configuracions dels dispositius poden ser diferents per altres models. En cas d'utilitzar el mateix model aquestes configuracions es poden copiar i engaxar directament.
- En cas de reutilitzar una xarxa, cal restablir els valors de fàbrica abans de carregar una nova configuració per evitar problemes. Es pot realitzar amb les següents comandes:  

Set device to default conf:  

    enable  
    write erase  
    reload  
    
> **Todo List** 
> - Corregir ortografia.
> - Millorar exemples d'eines i tècniques
> - Sol·lucionar alguns problemes de configuració de la xarxa **tfg_isp**
> - Anomenar correctament imatges de cada apartat.