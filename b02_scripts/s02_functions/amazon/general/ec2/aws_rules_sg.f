#!/bin/bash
#
# Script version 0.0.1
#
# Listado de Rules de Security Groups de AWS
# alias aw2rul

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

aws_rules_get_type()
{
case ${from} in 
80)
real_type="HTTP";;
2049)
real_type="NFS";;
22)
real_type="SSH";;
3389)
real_type="RDP";;
-1)
if [ "${rtype}" == "false" ] ; then
real_type="ICMP"
else
real_type="ALL"
fi
;;
esac
}

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--

#Obtener el grupo relacionado para reglas especiales que requiren especial confianza
aws_rules_get_group()
{

group_rel=$(aws ec2 describe-security-group-rules --filters "Name=security-group-rule-id,Values=${id}" | grep GroupId | grep "    " | tr -s " " | cut -d " " -f3)

}

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--

#Reglas del grupo de seguidad
aws_rules_sg()
{
VER="0.0.1"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Listado de reglas de un grupo de seguridad [$VER]	    					"
echo "=========================================================="
echo "Format  : aw2rul | aws_rules_sg [SG|VPC]                        "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

#Casos de funcionamiento 

# 1- No se pasa nada -- > Se listan todos los grupos de seguridad

# 2- Se pasa el SG  --> Se lista solo los de esa VPC

# * Requiere la ultima version de AWS CLI (2.3.6)

# /usr/local/bin/aws --version
# aws-cli/2.3.6 Python/3.8.8 Linux/5.4.0-90-lowlatency exe/x86_64.ubuntu.20 prompt/off


# Mostrar las VPCs de la region actual

TMP_FILE="/tmp/output_command_brqx"

if [ "$1" == "" ] ; then  
#Caso especial - No se pasa parametro - Miramos variables de entorno

#Suponemos que igual esta definida la variable VPCID
if [ "${VPCID}" != "" ] ; then  
#$1=${VPCID}
# Set cambia todos los argumentos
set -- "${VPCID}"
fi

fi

#Caso normal - Se pasa parametro

if [ "$1" != "" ] ; then  
SUB1=$(echo "$1" | cut -c1-3)
fi

case "${SUB1}" in 

"vpc")
# Caso 2 - Se pasa el ID del la VPC
VPCID=$1
aws ec2 describe-security-group-rules --filters "Name=vpc-id,Values=${VPCID}" --output yaml > ${TMP_FILE}
;;
"sg-")
# Caso 2 - Se pasa el ID del grupo
SGID=$1
aws ec2 describe-security-group-rules --filters "Name=group-id,Values=${SGID}" --output yaml > ${TMP_FILE}
;;
*)
#Caso 3 - No se pasa nada
aws ec2 describe-security-group-rules  --output yaml > ${TMP_FILE}
;;
esac

# Se puede filtrar por el grupo

# aws ec2 describe-security-groups --filters 'Name=vpc-id,Values=vpc-093ddee1dff52060d' | grep GroupName:
# aws ec2 describe-security-groups --filters 'Name=id,Values=sg-0bb7b4bf283831c78'

echo "ID :  FROM : TO : DESC : [ IN - IGRESS ] - [v$VER]"
echo "-----------------------------------------------------"

IDS=$(    cat ${TMP_FILE} | grep "SecurityGroupRuleId:" | tr "\t" " " | tr -s " " | cut -d " " -f3 | tr "\n" " ")
DESC=$(   cat ${TMP_FILE} | grep "Description:"         | tr "\t" " " | tr -s " " | cut -d " " -f3 | tr "\n" " ")
TYPES=$(  cat ${TMP_FILE} | grep "IsEgress:"            | tr "\t" " " | tr -s " " | cut -d " " -f3 | tr "\n" " ")
FROMS=$(  cat ${TMP_FILE} | grep "FromPort:"            | tr "\t" " " | tr -s " " | cut -d " " -f3 | tr "\n" " ")
TOS=$(    cat ${TMP_FILE} | grep "ToPort:"              | tr "\t" " " | tr -s " " | cut -d " " -f3 | tr "\n" " ")

# Bucle reglas de entrada

c=1
for id in ${IDS} ; do

rtype=$( echo ${TYPES} | cut -d " " -f${c}  )

if [ "${rtype}" == "false" ] ; then
from=$(  echo ${FROMS} | cut -d " " -f${c}  )
to=$(    echo ${TOS}   | cut -d " " -f${c}  )
desc=$(  echo ${DESC}  | cut -d " " -f${c}  )
aws_rules_get_type
aws_rules_get_group

echo "${id} : ${real_type} : ${from} : ${to}  : ${desc} <-- ${group_rel}"
fi

let c++
done

echo "-----------------------------------------------------"
echo "ID :  FROM : TO : DESC : [ OUT - EGRESS ] - [v$VER]"
echo "-----------------------------------------------------"

# Bucle reglas de salida

c=1
for id in ${IDS} ; do

rtype=$( echo ${TYPES} | cut -d " " -f${c}  )
from=$(  echo ${FROMS} | cut -d " " -f${c}  )
to=$(    echo ${TOS}   | cut -d " " -f${c}  )
desc=$(  echo ${DESC}  | cut -d " " -f${c}  )

if [ "${rtype}" != "false" ] ; then
from=$(  echo ${FROMS} | cut -d " " -f${c}  )
to=$(    echo ${TOS}   | cut -d " " -f${c}  )
desc=$(  echo ${DESC}  | cut -d " " -f${c}  )
aws_rules_get_type
aws_rules_get_group

echo "${id} : ${real_type} : ${from} : ${to}  : ${desc} --> ${group_rel} "
fi

let c++
done



echo "-----------------------------------------------------"


fi
}

