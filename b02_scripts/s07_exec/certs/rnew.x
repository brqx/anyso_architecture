#!/bin/bash
#
# Script version 0.0.0
#
# Renovacion Certificados
#example mydbex path

FECHA=$(date +'%Y%m%d')

#Status and Cert Files
STA_FILE="/tmp/zsta_${FECHA}"

DBG_FILE="/tmp/zdbg_${FECHA}"
CER_FILE="/tmp/zren_${FECHA}"

# Certbot renew

certbot renew &> ${CER_FILE}

# Copy Certs

/etc/haproxy/zren.x  &>  ${DBG_FILE}

# Restart Servers

kill -9 $(p nginx | tr -s " " | cut -d " " -f2 | tr "\n" " ") && rm -f /var/run/nginx/nginx_server*.sock   &>  ${DBG_FILE}

sleep 2

/usr/sbin/nginx -c /etc/nginx/nginx.conf && chown apache:apache /var/run/nginx/nginx_server*.sock          &>  ${DBG_FILE}

sleep 2

# Restart Proxy

service haproxy_ssl_01 restart &>  ${DBG_FILE}


echo "Renew Generated ${FECHA}" >> ${STA_FILE}

 