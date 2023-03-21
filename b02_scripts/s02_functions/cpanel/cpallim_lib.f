#!/bin/bash
#
# Script version 0.0.2
#
#Importa por completo todas las cuentas Cpanel en una ruta indicada
#example cpallim [path]
cpallim()
{
VER="0.0.2"
#-El nombre de la bd es una concatenacion
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Importa todas las cuentas de un servidor Cpanel [$VER]	        "
echo "=========================================================="
echo "Format  : cpallim PATH                                     "
echo "----------------------------------------------------------"
echo "Example : cpallim /sata/cpanel/import                       "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
INPUT_FOLDER=${1}

if [ "${INPUT_FOLDER}" == "" ] ; then
INPUT_FOLDER="/sata/cpanel/"
fi


# Cadenas de busqueda y reemplazo

echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Importa todas las cuentas del servidor Cpanel [$VER]	        "
echo "----------------------------------------------------------"
echo "Ruta Destino : ${INPUT_FOLDER}									"
echo "=========================================================="


OLD_PATH=${PWD}

cd ${INPUT_FOLDER}

exception_list="error_log|cprestore"

## Cuentas
accounts_dir=$(		llf	| grep -E -v "(${exception_list})" | tr "\n" " " )

accounts="${accounts_dir} ${accounts_links}"

OUTOUT="CLEAN"

for cuenta in ${accounts} ; do
echo "Importando : ${cuenta} ${OUTPUT_FOLDER}"

cpim ${cuenta} ${INPUT_FOLDER}
done

OUTOUT=""

cd ${OLD_PATH}


fi

}
