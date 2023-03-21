#!/bin/bash

#Sincroniza una BD de un servidor a otro

# Format  : mysx CADENA_DB | ( ENTORNO VARIANTE PROYECTO ) SERVER_REMOTE
# Example : mysx meto _p51 meto bbrqx.com
# Example : mysx meto_p51meto bbrqx.com

mysxstr()
{
VER="0.0.2"
#-El nombre de la bd es una concatenacion

if [ "${1}" == "-?" -o  "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Sincronismo BD en servidor [$VER]	"
echo "=========================================================="
echo "Format  : mysxstr  FILTER SERVER					"
echo "----------------------------------------------------------"
echo "Example : mysxstr unixy unixy.es	    	    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
FILTER_DB_IN=${1}
SERVER_TARGET=${2}

for database in $( mystr ${FILTER_DB_IN} ) ; do
echo "Sincronizando ${database}"
mysx "$database" "${SERVER_TARGET}" &> /dev/null
done

fi

}

