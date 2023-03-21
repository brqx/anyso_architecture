#!/usr/local/bin/python3

import logging
import pif
import pygodaddy
import urllib3
import sys 


ip_change = ""

if len(sys.argv) > 0:

	if len(sys.argv) >2 :
			ip_change = sys.argv[2] 
	
	domain = sys.argv[1]

	public_ip = pif.get_public_ip()

	if ip_change == "":
		ip_change = public_ip


	U="41549831"
	P="Ricardo_12323"
	client = pygodaddy.GoDaddyClient()                       
	success = client.login(U,P)                              

	if success:                                                                                      
			print("Cambio dominio: " + domain + " Con IP :" + ip_change)
			client.update_dns_record(domain, ip_change)

	else:                                                                                            
			print("Acceso fallido")

