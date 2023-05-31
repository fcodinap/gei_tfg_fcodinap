### Virtual PCS

> If DHCP on Lan Router
```
    ip dhcp
    save
```

> IF Static
> IP <ip> <netmask> <gw>
 
```
    ip 192.168.X.X 255.255.255.0 192.168.X.1
    save
```

---

### ADV Interface Configuration

**Config file**:  
*/etc/network/interfaces*

> STATIC

```
    auto ens33
    iface ens33 inet static
        address 192.168.3.2
        netmask 255.255.255.0
        gateway 192.168.3.1
```

> DHCP

```
    auto eth0
        allow-hotplug eth0
        iface eth0 inet dhcp
```

> On changing configuration:

```
    sudo <nano/vi> /etc/network/interfaces
    save
    sudo /etc/init.d networking restart
    ip addr # Check for changes
```

