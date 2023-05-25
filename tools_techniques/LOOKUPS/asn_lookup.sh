#!/bin/bash

# ASN Lookup with Dig
# Variables ASN and IP (prefixes are generated)

# Arg 1: Ip Adress to lookup

echo 'IP ADRESS: '
read ip

dig $(dig -x $ip | grep PTR | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}').origin.asn.cymru.com TXT +short } > dig_lookup.txt

ASN=`cat dig_lookup.txt | sed 's/["]//g' | awk '{print $1}'`
IP=`cat dig_lookup.txt | sed 's/["]//g' | awk -F'|' '{print $2}'`

echo 'AS'$ASN 'owns:'$IP
