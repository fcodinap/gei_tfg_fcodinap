#!/usr/bin/env python

# exemple_shodan_api.py
#
# Exemple bàsic d'ús de la API per python de Shodan per interactuar amb la base de dades.
# Exemple extret de la documentació de Shodan API

import shodan
import sys

API_KEY = 'substituir_per_api_key'


api = shodan.Shodan(API_KEY)

query = ' '.join(sys.argv[1:])
result = api.search(query)

for service in result['matches']:
	print(service['ip_str'])
