#!/usr/local/bin/python

import logging
import pif
import pygodaddy
import urllib3
import sys 


domain = sys.argv[1]
ip_change = sys.argv[2] 

public_ip = pif.get_public_ip()

if ip_change == "":
	ip_change = public_ip


U="41549831"
P="Ricardo_12323"
client = pygodaddy.GoDaddyClient()                       
success = client.login(U,P)                              

if success:                                                                                      
		print("Cambio dominio: " + domain + " Con IP : " + ip_change)
		client.update_dns_record(domain, ip_change)

else:                                                                                            
		print("Acceso fallido")

