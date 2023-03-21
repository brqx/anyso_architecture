#!/bin/bash
#
# Script version 0.0.3
#
# Listado de Security Groups de AWS
# alias aw2sgs

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=


aws_list_sgs()
{
VER="0.0.2"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Listado de grupos de seguridad [$VER]	    					"
echo "=========================================================="
echo "Format  : aw2sgs | aws_list_sgs [SG|VPC]                        "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

#Casos de funcionamiento 

# 1- No se pasa nada -- > Se listan todos los grupos de seguridad

# 2- Se pasa la VPC  --> Se lista solo los de esa VPC

# Mostrar las VPCs de la region actual

TMP_FILE="/tmp/output_command_brqx"

# Review defined VPC
__set_current_vpc $*


#Caso normal - Se pasa parametro

if [ "$1" != "" ] ; then  
SUB1=$(echo "$1" | cut -c1-3)
fi

case "${SUB1}" in 

"vpc")
# Caso 2 - Se pasa el ID del la VPC
VPCID=$1
aws ec2 describe-security-groups --filters "Name=vpc-id,Values=${VPCID}" --output yaml > ${TMP_FILE}
;;
"sg-")
# Caso 2 - Se pasa el ID del grupo
SGID=$1
aws ec2 describe-security-groups --group-id ${SGID} --output yaml > ${TMP_FILE}
;;
*)
#Caso 3 - No se pasa nada
aws ec2 describe-security-groups  --output yaml > ${TMP_FILE}
;;
esac

# Se puede filtrar por el grupo

# aws ec2 describe-security-groups --filters 'Name=vpc-id,Values=vpc-093ddee1dff52060d' | grep GroupName:
# aws ec2 describe-security-groups --filters 'Name=id,Values=sg-0bb7b4bf283831c78'

echo "ID :  NAME : DESC : VPC_ID : [ FROM SG_SOURCE ] - [v$VER]"
echo "-----------------------------------------------------"

NAMES=$(  cat ${TMP_FILE} | grep "GroupName:"   | tr "\t" " " | tr -s " " | cut -d " " -f3 | tr "\n" " ")
# Quitamos el segundo Group ID Source
IDS=$(    cat ${TMP_FILE} | grep "GroupId:"     | grep -v "    "   | tr "\t" " " | tr -s " " | cut -d " " -f3 | tr "\n" " ")
DESC=$(   cat ${TMP_FILE} | grep "Description:" | tr "\t" " " | tr -s " " | cut -d " " -f3 | tr "\n" " ")
VPCS=$(   cat ${TMP_FILE} | grep "VpcId:"       | tr "\t" " " | tr -s " " | cut -d " " -f3 | tr "\n" " ")

c=1
for id in ${IDS} ; do
name=$( echo ${NAMES} | cut -d " " -f${c}  )
vpc=$(  echo ${VPCS}  | cut -d " " -f${c}  )
desc=$( echo ${DESC}  | cut -d " " -f${c}  )

# Son los grupos origen en los que se confia para trafico entrante
sg_source=$( aws ec2 describe-security-groups --group-id ${id} | grep GroupId | grep "    " | tr "-" " " | tr -s " " | cut -d " " -f3-4  | tr " " "-" )

if [ "${sg_source}" != "" ] ; then
echo "${id} : ${name} : ${vpc}  : ${desc} - FROM ${sg_source} "
else
echo "${id} : ${name} : ${vpc}  : ${desc}"
fi

let c++

done

echo "-----------------------------------------------------"


fi
}

