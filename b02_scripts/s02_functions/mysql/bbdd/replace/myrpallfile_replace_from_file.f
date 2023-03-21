#!/bin/bash
#
# Script version 0.0.2
#
#Reemplaza una cadena por otra en multiples BD
#example dbreplace unixy _p50 rct brqxrct.com unixy.es
myrpallfile()
{
VER="0.0.2"
#-El nombre de la bd es una concatenacion

if [ "${1}" == "-?" -o  "${1}" == "" -o  "${2}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Reemplazo de cadenas en entorno LIVE - Produccion	[$VER]	"
echo "=========================================================="
echo "Format  : myrpallfile  FILTER FILE_REPLACE				"
echo "----------------------------------------------------------"
echo "Example : myrpallfile drupal_ certicom.lan	    	    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
DB_FILTER_IN=${1}
REPLACE_FILE=${2}

for filter_line in $(cat ${REPLACE_FILE} | grep -v "^#" ) ; do
echo $filter_line
SEARCH_PAR=$(echo ${filter_line} | cut -d ":" -f1)
REPLACE_PAR=$(echo ${filter_line} | cut -d ":" -f2)
myrpall "${DB_FILTER_IN}" "${SEARCH_PAR}" "${REPLACE_PAR}"  &> /dev/null

done


fi
}