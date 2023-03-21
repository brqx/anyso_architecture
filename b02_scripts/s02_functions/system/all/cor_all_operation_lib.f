#!/bin/bash
#
# Script version 0.0.4
#
#- Cluster Operations 
cor()
{
VER="0.0.4"
##"${1}" == "-?" -o

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Cluster Operation en arquitectura Brqx [$VER]             "
echo "=========================================================="
echo "Format  : cor COMMAND                                     "
echo "----------------------------------------------------------"
echo "Example : wccr light                                      "
echo "Example : wccr mainwar                                    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

OUTOUT="CLEANX"

COMMAND="${1}"

LOCAL_COMMAND=$(    echo "${COMMAND}"  | cut -d ":" -f1 )
REMOTE_COMMAND=$(   echo "${COMMAND}"  | cut -d ":" -f2 )


#-Main cluster server file- Knows cluster memmbers
CLUSTER_SERVER_FILE=/brqz/zzc/cluster.clu

SERVER_NAME=$(uname -n | cut -d "." -f2- )

for servidor in $(cat "${CLUSTER_SERVER_FILE}"  | grep -v "^#" ) ; do
if [ "${SERVER_NAME}" == "${servidor}" ] ; then
##echo "Run local command : ${SERVER_NAME} == ${servidor}"
eval "${LOCAL_COMMAND}"                          2> /dev/null
else
##echo "Run remote command"
REMOTE_COMMAND=$( echo "${REMOTE_COMMAND}" | sed -i "s/[CLUSTER]/$servidor/g" )
#echo ${REMOTE_COMMAND}
${REMOTE_COMMAND}            2> /dev/null
fi

done

fi
}
