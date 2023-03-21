#!/bin/bash
# Brqx Unix Architectures - Farmacia Zaragoza - 2022
# Script version 0.0.0.1
# 
# Muestra la informacion importante de las redes creadas
# alias dni

dn_network_fast_inspect()
{
VER="0.0.0.1"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Muestra la informacion de las redes creadas en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : dni | dn_network_fast_inspect [ALL|all|name]    "
echo "Example : dni web02                                       "
echo "Example : dni                                             "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Ejecuta bash en nuestro contenedor

RED=${1}

# Hooks para docker
__d

if   [ "${RED}" == ""    ] ; then
# Entonces vamos a mostrar el pasado como parametro
REDES=$(docker network list | tr -s " " | egrep -v "ID|none|host" | cut -d " " -f2 )
elif [ "${RED}" == "ALL" -o "${RED}" == "all" ] ; then
REDES=$(docker network list | tr -s " " | grep -v "ID"            | cut -d " " -f2 )
else
# Entonces vamos a mostrar el pasado como parametro

REDES=$(docker network list | tr -s " " | grep "${RED}" | cut -d " " -f2 )
fi

#echo "REDES --> ${REDES}"

if [ "${REDES}" != "" ] ; then

echo "Red      Driver       Subnet          Gateway"
echo "----------------------------------------------"

for red in ${REDES} ; do

docker network inspect ${red} | tr -s " " | tr -d '"' | tr -d "," > $TMP_FILE 

DRIVER=$(cat ${TMP_FILE} | grep "Driver" | head -1 | cut -d " " -f3-  )
SUBNET=$(cat ${TMP_FILE} | grep "Subnet" | head -1 | cut -d " " -f3-)
GATEWAY=$(cat ${TMP_FILE} | grep "Gateway" | head -1 | cut -d " " -f3-)

echo "${red}    ${DRIVER}     ${SUBNET}   ${GATEWAY}"

done

fi

fi
}
