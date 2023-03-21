#!/bin/bash
#
# Script version 0.0.2
#
#Reemplaza una cadena por otra en una BD
#example dbreplace unixy _p50 rct brqxrct.com unixy.es
myrp()
{
VER="0.0.2"
#-El nombre de la bd es una concatenacion
##"${1}" == "-?" -o

if [ "${1}" == "-?" -o  "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Reemplazo de cadenas en entorno LIVE - Produccion	[$VER]	"
echo "=========================================================="
echo "Format  : myrp ENTORNO VARIANTE PROYECTO | CADENA_DB SEARCH REPLACE		"
echo "----------------------------------------------------------"
echo "Example : myrp unixy _p50 rct brqxrct.com unixy.es	    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
PAR_01=${1}
PAR_02=${2}
PAR_03=${3}
PAR_04=${4}
PAR_05=${5}
PAR_06=${6}


tratar_cadena_db  ${PAR_01} ${PAR_02} ${PAR_03} ${PAR_04} ${PAR_05} ${PAR_06}


# Cadenas de busqueda y reemplazo


PHP_SCRIPT=/root/scripts/cache_clear_replace_string_in_db.php

echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Reemplazo de cadenas en entorno LIVE - Produccion			"
echo "----------------------------------------------------------"
echo "Base de datos : ${ENTORNO}${VARIANTE}${PROYECTO}			"
echo "=========================================================="
echo "Cadena a buscar : $SEARCH									"
echo "Cadena a cambiar: $REPLACE								"
echo "----------------------------------------------------------"

php -f ${PHP_SCRIPT} ${ENTORNO} ${VARIANTE} ${PROYECTO} ${SEARCH} ${REPLACE} &> /tmp/replace.log

fi

}

#Reemplaza multiples BBDD
db_rplan()
{
if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Reemplazo de cadenas multi idioma LIVE - Produccion		"
echo "=========================================================="
echo "Format  : ENTORNO VARIANTE PROYECTO SEARCH REPLACE		"
echo "----------------------------------------------------------"
echo "Example : dbrplan unixy _p50 rct brqxrct.com unixy.es		"
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
else

#-El nombre de la bd es una concatenacion
ENTORNO=${1}
VARIANTE=${2}
PROYECTO=${3}

# Cadenas de busqueda y reemplazo

SEARCH_DOMAIN=${4}
REPLACE_DOMAIN=${5}

LANGUAGES="es al it pt fr en"
PHP_SCRIPT=/root/scripts/cache_clear_replace_string_in_db.php

# Cadenas de busqueda y reemplazo

SEARCH[1]=esp.${SEARCH_DOMAIN}
REPLACE[1]=esp.${REPLACE_DOMAIN}

SEARCH[2]=eng.${SEARCH_DOMAIN}
REPLACE[2]=eng.${REPLACE_DOMAIN}

SEARCH[3]=ita.${SEARCH_DOMAIN}
REPLACE[3]=ita.${REPLACE_DOMAIN}

SEARCH[4]=fra.${SEARCH_DOMAIN}
REPLACE[4]=fra.${REPLACE_DOMAIN}

SEARCH[5]=por.${SEARCH_DOMAIN}
REPLACE[5]=por.${REPLACE_DOMAIN}

SEARCH[6]=ale.${SEARCH_DOMAIN}
REPLACE[6]=ale.${REPLACE_DOMAIN}

echo "Reemplazo de cadenas en entorno LIVE - Produccion		"
echo "------------------------------------------------------"
echo "Base de datos : ${ENTORNO}${VARIANTE}${PROYECTO}		"
echo "======================================================"
echo "Cadena a buscar : ${SEARCH[1]}                        "
echo "Cadena a cambiar: ${REPLACE[1]}                       "
echo "------------------------------------------------------"

for lan in ${LANGUAGES} ; do

PROYECTO=${lan}

#Iteracion para una BD
for i in 1 2 3 4 5 6 ; do

echo "${SEARCH[$i]} ${REPLACE[$i]}"
php -f ${PHP_SCRIPT} ${ENTORNO} ${VARIANTE} ${PROYECTO} ${SEARCH[$i]} ${REPLACE[$i]} &> /tmp/replace.log

done

done

fi
}