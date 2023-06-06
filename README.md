

# Tests de Penetració i Xarxes de Proveïdors de Serveis d'Internet
### *Aprofundiment en procediments i tècniques en Seguretat Informàtica*

---

**Treball Fi de Grau - Grau d'Enginyeria Informàtica - Àrea Seguretat Informàtica**  

**Autor:** *Francesc Codina Pena*   
**Tutor:** *Gerard Farràs Ballabriga*   
**Contacte:** *fcodinap@uoc.edu*  
**Curs:** *FEB-JUN, 2023*  

---  

## Resum del Treball  
Les xarxes des d’on s’accedeix a Internet que les companyies de comunicacions posen a disposició dels clients són un dels punts crítics en la defensa davant atacs perpetrats per adversaris amb la intenció d’obtenir informació o interrompre l’accés d’aquests usuaris a la xarxa global. Els procediments clàssics d’auditoria de seguretat i anàlisi de vulnerabilitats es troben moltes vegades obsolets davant de la gran diversitat d’atacs i la creativitat d’alguns atacants a l’hora de dur a terme aquests. És per això que procediments de seguretat ofensiva en la que es simula un adversari com els tests de penetració han pres un rol rellevant a l’hora de determinar l’estat de la seguretat d’un sistema.

En aquest treball es realitza una primera aproximació a aquest procediment realitzant un repàs d’aquells conceptes teòrics i elements necessaris per entendre la seguretat informàtica a l’arquitectura de la xarxa d’un proveïdor de serveis d’internet per seguidament i mitjançant exemples pràctics i d’ús realitzar un estudi de tècniques i eines utilitzades sobre la simulació de la xarxa d’una ISP amb la intenció de simular l’actuació d’un adversari en un entorn real. Aquest estudi de la seguretat ofensiva es realitza al llarg del treball recolzant-se en la simulació d’una xarxa mitjançant l’eina GSN3, que a banda de servir com entorn on realitzar les execucions ha resultat una eina clau per aprofundir en el disseny, implementació i gestió de la xarxa d’una ISP i en els mecanismes dels que aquesta disposa per defensar-se davant d’atacs de disrupció de serveis i d’altra naturalesa.

---
## Estructura i ús del Repositori


- ### Enviroment

--- 
En aquest directori s'hi poden trobar les configuracions de l'entorn i arxius relacionats: *VMs, GSN3 Server, GSN3 Client*. Addicionalment s'hi pot trobar una llista de les imatges
dels dispositius: *routers, switchs, firewalls, servers,* ...


- ### Network 

--- 
Aquest directori conte les diferents xarxes utilitzades al llarg del treball en exemples i casos d'ús. Cada versió de la xarxa inclou una descripció, elements que la componen, arxius de configuració de dispositius i altres documents relacionats amb la topologia. Addicionalment els espais d'adreces utilitzats al llarg del treball es troben descrits en aquest apartat.


- ### Tools_Techniques

--- 
Aquest directori inclou una recopilació i documentació sobre eines utilitzades al llarg del treball i guies de posada en marxa en alguns casos per una banda iscripts i comandes creades per a tal efecte per altra banda.



> **TODO**
> - Index