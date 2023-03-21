#!/bin/bash
#
# Script version 0.0.2
#
#Informa del estado de un cluster MariaDb - Percona
#example wsrep
wsrep()
{
VER="0.0.2"
#-Listado estado cluster
##"${1}" == "-?" -o

TYPE="${1}"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informa del estado de un cluster [$VER]	                "
echo "=========================================================="
echo "Format  : wsrep [parameters]                              "
echo "----------------------------------------------------------"
echo "Example : wsrep rx                                        "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
elif [ "${TYPE}" == "rx" ] ; then

# Bytes recibidos To check gcache
STR="SHOW STATUS LIKE 'wsrep_received_bytes';"
INFO="Informa del estado de un cluster ${PROYECTO}_brqx"

else

STR="SHOW STATUS LIKE 'wsrep%';"
INFO="Informa del estado de un cluster ${PROYECTO}_brqx"
fi

mysql -u root -e "${STR}"

}
