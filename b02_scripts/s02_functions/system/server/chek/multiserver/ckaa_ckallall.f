#!/bin/bash
#
# Script version 0.0.2
#
#Sincroniza la ruta que se le indique en el servidor indicado
#Bidireccional
#example mydbex path

ckallall()
{
VER="0.0.2"
#-El nombre de la bd es una concatenacion

SERVER_LIST=${1}

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Chequeo multi servidor - Arquitectura Brqx [$VER]			"
echo "=========================================================="
echo "Format  : ckallall SERVER [PATH]                            	"
echo "----------------------------------------------------------"
echo "Example : ckallall pbrqx.com 								"
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

if [ "${SERVER_LIST}" == "" ] ; then
SERVER_LIST=/brqi/zzc/servers.lst
fi

#-Obtenemos las cabeceras
ckallhdrout


c=0
for server in $( cat ${SERVER_LIST} | tr "\n" " " ) ; do

#echo ckall ${server}
ckout ${server}

let c++
done



fi



}
