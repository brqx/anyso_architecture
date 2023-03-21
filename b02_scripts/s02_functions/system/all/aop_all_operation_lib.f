#!/bin/bash
#
# Script version 0.0.4
#
#- All Servers Operations 
aop()
{
VER="0.0.4"

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Cluster Operation en arquitectura Brqx [$VER]             "
echo "=========================================================="
echo "Format  : aop SITE_ID                                    "
echo "----------------------------------------------------------"
echo "Example : aop light                                      "
echo "Example : aop mainwar                                    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

COMMAND="${@}"

#-Main cluster server file- Knows cluster memmbers
CLUSTER_SERVER_FILE=/brqi/zzc/allservers.brqx

SERVER_NAME=$(uname -n | cut -d "." -f2- )

for servidor in $(cat "${CLUSTER_SERVER_FILE}"  | grep -v "^#" ) ; do
if [ "${SERVER_NAME}" == "${servidor}" ] ; then
##echo "Run local command : ${SERVER_NAME} == ${servidor}"
eval "${COMMAND}"                          	 	&> /dev/null    &
else
##echo "Run remote command Blocked : ${COMMAND}"
ssh $servidor "${COMMAND}"            	 		&> /dev/null    &
fi

done

fi
}
