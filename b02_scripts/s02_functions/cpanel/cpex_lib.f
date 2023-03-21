#!/bin/bash
#
# Script version 0.0.3
#
#Exporta por completo una cuenta cpanel en una ruta indicada
#example cpex path
cpex()
{
VER="0.0.3"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Exporta una BD en formato SQL [$VER]						"
echo "=========================================================="
echo "Format  : cpex ACCOUNT PATH                                     "
echo "----------------------------------------------------------"
echo "Example : cpex war /sata/cpanel/war                       "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
OUTPUT_ACCOUNT=${1}
OUTPUT_FOLDER=${2}


if [ "${OUTPUT_FOLDER}" == "" ] ; then
OUTPUT_FOLDER="/sata/cpanel/"
fi


# Cadenas de busqueda y reemplazo
if [ "${OUTOUT}" != "CLEAN" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Exporta una cuenta Cpanel [$VER]	        "
echo "--------------------------------------------------------------------"
echo "Ruta Destino  : ${OUTPUT_FOLDER}									"
echo "Cuenta        :  ${OUTPUT_DB}											    "
echo "========================================="
fi

#rm "$OUTPUTDIR/*gz" > /dev/null 2>&1

CPANEL_SCRIPT="/scripts/pkgacct "

#-el formato es fijo cpmove-account.tar.gz

${CPANEL_SCRIPT}  ${OUTPUT_ACCOUNT} ${OUTPUT_FOLDER} &> /dev/null

fi
}
