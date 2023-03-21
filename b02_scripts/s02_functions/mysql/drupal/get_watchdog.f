#!/bin/bash
#
# Script version 0.0.2
#
#Cuenta las BBDD formato MyIsam que existen en el servidor
#example myisam
watchdog()
{
VER="0.0.2"
#-Listado estado cluster
##"${1}" == "-?" -o

TABLA="${1}"

if [ "${TABLA}" == "" ]; then
TABLA=$( surl  | grep home | cut -d " " -f3 )

fi

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Lista los registros de la tabla Watchdog de drupal        "
echo "=========================================================="
echo "Format  : watchdog [table]                                "
echo "----------------------------------------------------------"
echo "Example : watchdog  za_d50gggg                            "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
elif [ "${1}" == "list" ] ;then

STR="select * from $TABLA.watchdog"

echo "----------------------------------------------------------------------"
echo "Lista los registros de la BBDD ${TABLA}.Watchdog en ${HOSTNAME}    "
echo "--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--"
mysql -u root -e "${STR}"
echo "----------------------------------------------------------------------"

else

# Bytes recibidos To check gcache
STR="select count(*) from ${TABLA}.watchdog"
STRDEL="truncate ${TABLA}.watchdog"

OUT_WATCHDOG=$( mysql -u root -e "${STR}" 2> /dev/null )
NUM_WATCHDOG=$( mysql -u root -e "${STR}" 2> /dev/null | grep -v "-" | grep -v count )


echo "----------------------------------------------------------------------"

if [ "${NUM_WATCHDOG}" == "0" ] ; then
echo "Contando las registros BBDD ${TABLA}.Watchdog en sistema : ${HOSTNAME}"
echo "--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--"
echo "${OUT_WATCHDOG}" 
echo "----------------------------------------------------------------------"
else
echo "Se eliminan los registros de la tabala ${TABLA}.Watchdog :${NUM_WATCHDOG} "
mysql -u root -e "${STRDEL}" 2> /dev/null 
fi

fi
}
