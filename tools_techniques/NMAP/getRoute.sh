#!/bin/bash

####### TODO: Add option to select Packet Type {ICMP, TCP or UDP} #######

#   Name:           getRoute.sh
#   Author:         Francesc Codina Pena
#   Date:           Abril 2023
#
#   Description:    Uses <ICMP> Traceroute Output to gets and generates list with those IP.
#   
#   Use:            ./getRoute.sh <DST IP>
#   Output:         <DST IP>_route.txt > ./routes directory
#

if [[ $# != 1 ]];
then
echo "Insert IP to route"
fi

# Checks valid IP format

if [[ $1 =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; 
then
traceroute $1 > ./routes/routetemp.txt &
process_id=$!
wait $process_id    # Need to wait for traceroute to end

cat ./routes/routetemp.txt | awk 'NR > 1 {print $2}' > ./routes/$1_route.txt
rm ./routes/routetemp.txt

else
  echo "Invalid IP format"
fi




