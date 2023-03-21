#!/bin/bash
#
# Script version 0.0.2
#
#Reemplaza una cadena por otra en multiples BD
#example dbreplace unixy _p50 rct brqxrct.com unixy.es
mycplan()
{
VER="0.0.2"
#-El nombre de la bd es una concatenacion

if [ "${1}" == "-?" -o  "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Reemplazo de cadenas en entorno LIVE - Produccion	[$VER]	"
echo "=========================================================="
echo "Format  : myrpall  SOURCE TARGET                          "
echo "----------------------------------------------------------"
echo "Example : mycplan rct_p50main_n_aa rct_p50co_n_aa	    	    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
#mycplan rct_p50main rrct_p50co
#mycp rct_p50main_n_aa rct_p50co_n_aa

SOURCE_DB=${1}
TARGET_DB=${2}

LEN_SOURCE=${#SOURCE_DB}
LEN_TARGET=${#TARGET_DB}


BASE_LEN_SRC=$( expr ${LEN_SOURCE} - 3 )
BASE_LEN_TAR=$( expr ${LEN_TARGET} - 3 )


DB_NAME_SRC=${SOURCE_DB:0:${BASE_LEN_SRC}}
DB_NAME_TAR=${TARGET_DB:0:${BASE_LEN_TAR}}


LAN_NAME=${SOURCE_DB:${BASE_LEN}:${LEN_SOURCE}}

for database in $( mystr ${DB_NAME_SRC} ) ; do

LAN_NAME=${database:${BASE_LEN_SRC}:${LEN_SOURCE}}
##echo "Copiando ${DB_NAME_SRC}${LAN_NAME} ==> ${DB_NAME_TAR}${LAN_NAME}"

mycp "${DB_NAME_SRC}${LAN_NAME}" "${DB_NAME_TAR}${LAN_NAME}"

done

fi
}