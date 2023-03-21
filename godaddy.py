#!/usr/local/bin/python

import logging
import pif
import pygodaddy
import urllib3
#import urllib3.contrib.pyopenssl
#urllib3.contrib.pyopenssl.inject_into_urllib3()


# Disable warning
urllib3.disable_warnings()

# Original Source:
# https://saschpe.wordpress.com/2013/11/12/godaddy-dyndns-for-the-poor/
# https://github.com/observerss/pygodaddy
# 
# Modified by Jeremy Sears (https://stackoverflow.com/users/1240482/jsears)


logging.basicConfig(filename='godaddy.log', format='%(asctime)s %(message)s', level=logging.INFO)
# the "requests" library logs noisily, so turn that off                                                       
logging.getLogger("requests").setLevel(logging.WARNING)

logging.debug("DEBUG:   Running godaddy_ddns.py")

# print("Hola amigos  - Inciando python godaddy")

# 'New' ip!
public_ip = pif.get_public_ip()

#U2=&quot;@41549831@&quot;
#P2=&quot;@Ricardo_12323@&quot;

U="41549831"
P="Ricardo_12323"
client = pygodaddy.GoDaddyClient()                       
#success = client.login(U2,P2)                              

success = client.login(U,P)                              
#print(success)
if success:                                                                                      
#		print("Acceso correcto")
		logging.debug("DEBUG:   Successfully logged in.")                
		# 'New' ip!
#		Recorrer todos los dominios e imprimirlos
#		for domain in client.find_domains():
#			print domain
		domain="pbrqx.com"

		domain2="home.pbrqx.com"

		domain3="rome.pbrqx.com"

		dns_records = client.find_dns_records(domain)

		old_ip = list(dns_records)[0].value
		print(old_ip  +  ' - '  + public_ip)
		client.update_dns_record(domain2, "72.46.135.146")

#- no implementado
		client.update_dns_record(domain3, "ns1.pbrqx.com",'CNAME')

		dns_records = client.find_dns_records(domain2)


		print(old_ip  +  ' - '  + public_ip)

else:                                                                                            
		print("Acceso fallido")
		logging.error("ERROR:   Failed to log in to godaddy.com with username: '{0}'.".format(U))

