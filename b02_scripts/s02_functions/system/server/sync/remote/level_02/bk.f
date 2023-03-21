#!/bin/bash
#
# Script version 0.0.2
#
#Sincroniza la ruta que se le indique en el servidor indicado
#Bidireccional
#example mydbex path
bk()
{
VER="0.0.2"
#-El nombre de la bd es una concatenacion

SERVER=$1
BK_PATH=$2
PORT=$3

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Backup servidor ruta [$VER]								"
echo "=========================================================="
echo "Format  : bk SERVER [PATH]                             	"
echo "----------------------------------------------------------"
echo "Example : bk pbrqx.com /sata/mysql/export              	"
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Backup servidor  ${SOURCE_SERVER} ==> ${SERVER} [${IP_SERVER}] Arquitectura Brqx - [$VER]        "
echo "=========================================================="
echo
##for src in '/home/' '/lang/' '/klus/' '/sync/' '/host/'  ; do


fi

}
