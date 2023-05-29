#!/bin/bash
#
#   Description:    Select relevant information from NMAP output files. Extended Scan Example
#   
#   Use:            ./prep_info.sh
#   Output:         Detail of NMAP scans
#


grep -w "open" extended_enumeration.txt | awk '{ for (counter = FNR; counter > 0; counter--) for(i=1; i<=NF; i++) print $i;}' > tmp.txt
grep open tmp.txt > tmp1.txt

echo " " >> extended_scan_brief
echo "*************************************" >> extended_scan_brief
echo "EXTENDED NMAP SCAN EXAMPLE BRIEF FILE" >> extended_scan_brief
echo "*************************************" >> extended_scan_brief
echo " " >> extended_scan_brief
echo " " >> extended_scan_brief
echo "-------------------------------------------" >> extended_scan_brief
echo " Scan command: sudo nmap -Pn -sV -oG extended_enumeration.txt 100.64.0.0/24 -p cat ../lists/ISP_ports.txt" >> extended_scan_brief
echo "-------------------------------------------" >> extended_scan_brief
echo " " >> extended_scan_brief
echo "######## PORT SCAN RESPONSIVE HOSTS ########" >> extended_scan_brief
echo " " >> extended_scan_brief

grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' tmp.txt | uniq >> extended_scan_brief
echo " " >> extended_scan_brief

echo "##### OPENED PORTS LIST (NO FILTERED) ######" >> extended_scan_brief
echo " " >> extended_scan_brief

grep -w open tmp.txt | awk -F '/' '{print $1 " " $3 " " $5}' | sort | uniq >> extended_scan_brief

echo " " >> extended_scan_brief
echo "-------------------------------------------" >> extended_scan_brief
echo " Scan command:  sudo nmap -sO -oG extended_IP_enumeration.txt 100.64.0.0/24"  >> extended_scan_brief
echo "-------------------------------------------" >> extended_scan_brief
echo " " >> extended_scan_brief
echo " ######## IP SCAN ACTIVE HOSTS ######## "echo " " >> extended_scan_brief

grep -w "open" extended_IP_enumeration.txt | awk '{ for (counter = FNR; counter > 0; counter--) for(i=1; i<=NF; i++) print $i;}' > tmp.txt
grep open tmp.txt > tmp1.txt

grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' tmp.txt | uniq >> extended_scan_brief

echo " " >> extended_scan_brief

echo "##### OPENED OR FILTERED IP PROTOCOLS  ######" >> extended_scan_brief

echo " " >> extended_scan_brief

grep -w open tmp.txt | awk -F '/' '{print $1 " " $3 " " $5}' | sort | uniq >> extended_scan_brief

echo " " >> extended_scan_brief
echo "-------------------------------------------" >> extended_scan_brief
echo " Other Scans:  sudo nmap --script=broadcast-ospf2-discover -oG extended_ospf_enumeration.txt"  >> extended_scan_brief
echo " Other Scans:  sudo nmap --script broadcast-pppoe-discover -oG extended_pppoe_enumeration.txt"  >> extended_scan_brief
echo "-------------------------------------------" >> extended_scan_brief
echo " " >> extended_scan_brief
echo "######## OSPF DETAILS########" >> extended_scan_brief
echo " " >> extended_scan_brief
cat extended_ospf_enumeration.txt  >> extended_scan_brief
echo " " >> extended_scan_brief
echo "######## PPPoE DETAILS ########" >> extended_scan_brief
echo " " >> extended_scan_brief
cat extended_pppoe_enumeration.txt  >> extended_scan_brief
echo " " >> extended_scan_brief
rm tmp.txt tmp1.txt
