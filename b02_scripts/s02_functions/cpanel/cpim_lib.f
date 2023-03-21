#!/bin/bash
#
# Script version 0.0.3
#
#Importa por completo una cuenta cpanel en una ruta indicada
#example cpex path
cpim()
{
VER="0.0.3"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Importa una BD en formato SQL [$VER]						"
echo "=========================================================="
echo "Format  : cpim ACCOUNT PATH                                     "
echo "----------------------------------------------------------"
echo "Example : cpim war /sata/cpanel/war                       "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
INPUT_ACCOUNT=${1}
INPUT_FOLDER=${2}


if [ "${INPUT_FOLDER}" == "" ] ; then
INPUT_FOLDER="/sata/cpanel/"
fi


# Cadenas de busqueda y reemplazo
if [ "${OUTOUT}" != "CLEAN" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Importa una cuenta Cpanel [$VER]	        "
echo "--------------------------------------------------------------------"
echo "Ruta Destino  : ${INPUT_FOLDER}									"
echo "Cuenta        :  ${INPUT_ACCOUNT}											    "
echo "========================================="
fi

echo ${INPUT_ACCOUNT} | grep "cpmove" &> /dev/null
grep_OUT=$?

if [ "${grep_OUT}" != "0" ] ; then
#No es un un archivo con cpmove. Es nombre de cuenta
FILENAME="cpmove-${INPUT_ACCOUNT}.tar.gz"
else
FILENAME=${INPUT_ACCOUNT}
fi

CPANEL_SCRIPT="/scripts/restorepkg"

FULL_NAME="${INPUT_FOLDER}/${FILENAME}"
#-el formato es fijo cpmove-account.tar.gz

${CPANEL_SCRIPT}  ${FULL_NAME}  &> /dev/null

fi
}
