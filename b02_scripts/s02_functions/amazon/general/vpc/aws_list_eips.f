#!/bin/bash
#
# Script version 0.0.0.2
#
# Listado de Elastic IP de AWS
# alias aw2lips

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

__aws_inner_list_eips()
{

aws ec2 describe-addresses  --output yaml --region ${REGION} > ${TMP_FILE}

IDS=$(  cat ${TMP_FILE} | grep "AllocationId"     | tr "\t" " " | tr -s " " | cut -d " " -f3 | tr "\n" " ")
IPS=$(  cat ${TMP_FILE} | grep "PublicIp:"        | tr "\t" " " | tr -s  " " | cut -d " " -f3 | tr "\n" " ")

if [ "${IDS}" != "" ] ; then
c=1
for id in ${IDS} ; do
ip=$( echo ${IPS} | cut -d " " -f${c}  )

echo "A ${id} : ${ip} :  ${REGION}"

let c++

done
else
echo -n "${REGION} "
fi

}

#Listado de elastic ips de Aws

aws_list_eips()
{
VER="0.0.0.1"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Listado de ips reservadas [$VER]	    					"
echo "=========================================================="
echo "Format  : aw2lips | aws_list_eips [REGIONS]               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

#Casos de funcionamiento 

# 1- No se pasa nada -- > Listado de IPs (Elastic) de la region actual

# 2- Se pasa REGIONS ---> Listado de todas las regiones

# Mostrar las EIPs de la region actual

OPTION=$1

#Manage Tmp FIle
__tmp_file

echo "ID : IP - REGION" 
echo "-----------------------------------------------------"

case ${OPTION} in

REGIONS)

#Listado de EIPs de todas las regiones
__regions

for REGION in ${REGIONS} ; do

__aws_inner_list_eips

done
echo ""
;;
*)

#Listado de EIPs de la region actual

__region

__aws_inner_list_eips

;;

esac


echo "-----------------------------------------------------"


fi
}

