#!/bin/bash
#
# Script version 0.0.3
#
# Cambia la IP de un dominio o subdominio de Godaddy en arquitectura Brqx
#example gddc domain IP 
gddc()
{
VER="0.0.3"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Cambia la IP de un dominio o subdominio de Godaddy en arquitectura Brqx [$VER]						"
echo "=========================================================="
echo "Format  : gddc DOMAIN   [IP]                                  "
echo "----------------------------------------------------------"
echo "Example : cpex war thisisthewar.com                       "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
DOMAIN=${1}
IP_SERVER=${2}

if [ "${DOMAIN}" == "" ] ; then
#-ip gbrqx
DOMAIN="home.pbrqx.com"
fi

PYTHON_LIBS="/root/scripts/arq/c03_libs/python/"

PY_SRIPT="${PYTHON_LIBS}gdd_update_domain.py  ${DOMAIN}  ${IP_SERVER}"

#echo "Lanzamos : ${PY_SRIPT}"

IP_CAMBIADA=$( eval "${PY_SRIPT}" 2> /dev/null | cut -d ':' -f3 )



# Cadenas de busqueda y reemplazo
if [ "${OUTOUT}" != "CLEAN" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Cambia la IP de un dominio o subdominio de Godaddy en arquitectura Brqx [$VER]	        "
echo "--------------------------------------------------------------------"
echo "DOMAIN     :  ${DOMAIN}											    "
echo "--------------------------------------------------------------------"
echo "IP         :  ${IP_CAMBIADA}											    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--=="
fi


fi
}
