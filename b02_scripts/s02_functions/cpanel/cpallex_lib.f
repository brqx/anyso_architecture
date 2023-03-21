#!/bin/bash
#
# Script version 0.0.2
#
#Exporta por completo todas las cuentas Cpanel en una ruta indicada
#example cpallex path
cpallex()
{
VER="0.0.2"
#-El nombre de la bd es una concatenacion
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Exporta todas las cuentas de un servidor Cpanel [$VER]	        "
echo "=========================================================="
echo "Format  : cpallex PATH                                     "
echo "----------------------------------------------------------"
echo "Example : cpallex /sata/cpanel/export                       "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
OUTPUT_FOLDER=${1}

if [ "${OUTPUT_FOLDER}" == "" ] ; then
OUTPUT_FOLDER="/sata/cpanel/"
fi


# Cadenas de busqueda y reemplazo

echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Exporta todas las cuentas del servidor Cpanel [$VER]	        "
echo "----------------------------------------------------------"
echo "Ruta Destino : ${OUTPUT_FOLDER}									"
echo "=========================================================="


OLD_PATH=${PWD}

cd /home

exception_list="cpeasyapache|cprestore|virtfs|cpan|varnish|cPanel|exim|virtfs"

## Cuentas
accounts_dir=$(		lld	| grep -E -v "(${exception_list})" | tr "\n" " " )
accounts_links=$(		lll		| grep -E -v "(${exception_list})" | tr "\n" " " )

accounts="${accounts_dir} ${accounts_links}"

OUTOUT="CLEAN"

for cuenta in ${accounts} ; do
#echo "Exportando : ${cuenta} ${OUTPUT_FOLDER}"
cpex ${cuenta} ${OUTPUT_FOLDER}
done

OUTOUT=""

cd ${OLD_PATH}


fi

}
