#!/bin/bash
#
# Script version 0.0.2
#
#Sincroniza la ruta que se le indique en el servidor indicado
#Bidireccional
#example mydbex path
zsync()
{
VER="0.0.2"
#-El nombre de la bd es una concatenacion
SERVER=$1
SYNC_PATH=$2

if [ "${SYNC_PATH}" == "" ] ; then
SYNC_PATH=$PWD
fi


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Sincroniza una ruta [$VER]				"
echo "=========================================================="
echo "Format  : zsync SERVER [PATH]                             "
echo "----------------------------------------------------------"
echo "Example : zsync pbrqx.com /sata/mysql/export              "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Exporta por completo la BD en formato SQL [$VER]	        "
echo "----------------------------------------------------------"
echo "Ruta Destino : ${OUTPUT}									"
echo "=========================================================="


echo "Syncing Filesystems"
OLD_PATH=$PWD
cd ${SYNC_PATH}

src=${PWD};
dst=`dirname ${PWD}`;
rsync -atrvuz --append -e "ssh -oPort=${PORT}"  root@${SERVER}:${src} ${dst} 

cd ${OLD_PATH}
fi

}


BASE=/home/
SERVER=rbrqx.com

RUTA_01=${BASE}farmasyn/pubic_html/
RUTA_02=${BASE}sd/pubic_html/

zsync $SERVER ${RUTA_01}
zsync $SERVER ${RUTA_02}

