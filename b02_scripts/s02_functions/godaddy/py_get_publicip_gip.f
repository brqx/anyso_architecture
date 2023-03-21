#!/bin/bash
#
# Script version 0.0.3
#
#Obtiene la IP publica del equipo o servidor
#example cpex apcrvs cuenta dominio
gip()
{
VER="0.0.3"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Obtiene la IP publica del equipo o servidor Brqx [$VER]						"
echo "=========================================================="
echo "Format  : gip                                      "
echo "----------------------------------------------------------"
echo "Example : gip "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

PYTHON_LIBS="/root/scripts/arq/c03_libs/python/"

PY_SRIPT="${PYTHON_LIBS}get_public_ip.py"

IP=$( ${PY_SRIPT} | cut -d ':' -f2 )


# Cadenas de busqueda y reemplazo
if [ "${OUTOUT}" != "CLEAN" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Obtiene IP publica del equipo Brqx [$VER]	        "
echo "--------------------------------------------------------------------"
echo "IP         :  ${IP}											    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--=="
fi


fi
}
