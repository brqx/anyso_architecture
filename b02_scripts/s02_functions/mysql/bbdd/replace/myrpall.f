#!/bin/bash
#
# Script version 0.0.2
#
#Reemplaza una cadena por otra en multiples BD
#myrpall rct_p50co brqx.es brqx.co
myrpall()
{
VER="0.0.2"
#-El nombre de la bd es una concatenacion

if [ "${1}" == "-?" -o  "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Reemplazo de cadenas en entorno LIVE - Produccion	[$VER]	"
echo "=========================================================="
echo "Format  : myrpall  FILTER SEARCH REPLACE					"
echo "----------------------------------------------------------"
echo "Example : myrpall unixy brqxrct.com unixy.es	    	    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
FILTER_01=${1}
SEARCH_STR=${2}
REPLACE_STR=${3}

for database in $( mystr ${FILTER_01} ) ; do
echo "Reemplazando ${database}"
myrp "$database" "${SEARCH_STR}" "${REPLACE_STR}" &> /dev/null
done

fi
}