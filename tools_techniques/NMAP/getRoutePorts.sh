#!/bin/bash

#   Name:           getRoutePorts.sh
#   Author:         Francesc Codina Pena
#   Date:           Abril 2023
#
#   Description:    Uses NMAP to obtain opened ports given an ip route list.
#   
#   Use:            ./getRoutePorts.sh <Ip List>
#   Output:         ports.txt > ./routes directory
#

if [[ $# != 1 ]];
then
echo "No IP List or more than one list was selected"
fi

while IFS= read -r line; 
do
  sudo nmap --top-ports 25 $line/24 > ./routes/nmaptemp.txt
  process_id=$!
  wait $process_id    # Need to wait for traceroute to end

  cat ./routes/nmaptemp.txt | awk '$2 == "open" { sub("/.*","",$1); print $1 }' ./routes/nmaptemp.txt | paste -s -d, > ./routes/ports.txt
  rm ./routes/nmaptemp.txt

# Remove duplicates :: awk 'BEGIN{RS=ORS=","} !seen[$0]++' ports.txt

done < "$1"


### TODO: Need to resolve how results are stored