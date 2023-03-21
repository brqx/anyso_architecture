#!/bin/bash
#
# Script version 0.0.2
#
#Sincroniza la ruta que se le indique en el servidor indicado
#Bidireccional
#example mydbex path
mybk()
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

if [ "${SERVER}" == "" ] ; then
SERVER=hbrqx.com
fi

IP_SERVER=$( 		hostname -I 2> /dev/null | cut -d " " -f1  	)
if [ "${?}" != "0" ] ; then
IP_SERVER=$( 		hostname -i					  2> /dev/null	)
fi
SOURCE_SERVER=$(  	uname -n 	| cut -d "." -f2- | tr "." "_" )

if [ "${BK_PATH}" == "" ] ; then
# Normal BK: /sata/bk/zg/t2016/ene_01/
# Full BK: /sata/fk/zg/t2016/ene_01/

MONTH_NUMBER=$(	date '+%m'	)
MONTH_LETTER=$(	date '+%b'	)
YEAR_BK=$(		date '+%Y'	)


SERVER_LETTER=$( echo ${SOURCE_SERVER} 		| cut -c1 												)

##if [ "" != "${IP_SERVER}" ] ; then
##SERVER_LETTER=$( nslookup ${IP_SERVER} 	| grep name | cut -d '=' -f2 | head -1 | cut -c2		)
##fi

BK_PATH="/sata/mk/z${SERVER_LETTER}/t${YEAR_BK}/${MONTH_LETTER}_${MONTH_NUMBER}"

fi

if [ "${PORT}" == "" ] ; then
PORT=22
fi

echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Backup servidor  ${SOURCE_SERVER} ==> ${SERVER} [${IP_SERVER}] Arquitectura Brqx - [$VER]        "
echo "=========================================================="
echo "Format  : bk SERVER [PATH]                             "
echo "----------------------------------------------------------"
echo "Example : bk pbrqx.com /sata/mysql/export              "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

OLD_PATH=$PWD

CMD="mkdir -p ${BK_PATH}"
syncsure_OUT=$( ssh -oPasswordAuthentication=no  ${USER}@${SERVER} "${CMD}"  )
ssh_OUT=$?

if [ "${ssh_OUT}" == "0" ] ; then

for src in '/dbs/' '/dbx/'  ; do

if [ -d ${src} ] ; then

echo "Backup ${src} $(du -sh ${src} | tail -2 )"
#echo "rsync -atrvuz --append -e ssh -oPort=${PORT} ${src}  root@${SERVER}:${BK_PATH}${src}"
rsync -atrvuz --append -e "ssh -oPort=${PORT}" /sata/${src}  root@${SERVER}:${BK_PATH}${src}  		2> /dev/null  

fi

done

else

syncsure_OUT="NF"
syncsure_MSG="No existe la carpeta (${dst}) y tampoco se puede crear"
echo "${syncsure_MSG}"

fi

fi

}
