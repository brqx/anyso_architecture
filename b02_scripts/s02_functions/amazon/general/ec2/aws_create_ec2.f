#!/bin/bash
#
# Script version 0.0.3
#
# Listado de imágenes
# alias aw2c

__aws_create_ec2_inner()
{
#Manage Tmp File
__tmp_file

#Run instances
aws ec2 run-instances                 \
--image-id  ${ami_id}                 \
--instance-type ${bundle_id}          \
--iam-instance-profile Name="${instance_profile}" \
--security-group-ids ${seg_group_id}  \
--region ${region}                    \
--subnet-id ${subnet}                 \
--key-name ${key_pair}                \
--output yaml                         \
--user-data file://${user_data}       > ${TMP_FILE}


IID=$(cat ${TMP_FILE} | grep "InstanceId:")
ITY=$(cat ${TMP_FILE} | grep "InstanceType:")
ISG=$(cat ${TMP_FILE} | grep "GroupName:" | head -1 | tr -s " " | cut -d " " -f3 )

#done

echo "Lanzada Instancia con ID : ${IID} - Tipo ${ITY} - Grupo Seguridad ${ISG} "
}

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Create N Ec2 instances
aws_create_ec2()
{
VER="0.0.2"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Creacion de instancias ec2 pasadas por parametro"
echo "=========================================================="
echo "Format  : aw2c | aws_create_ec2 [numero instancias]                         "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
# Run instance example
#aw2c t2.micro ami 

NUM_INSTANCES=$1

if    [ "${FILTRO1}" != "z" ] ; then
#Hay un filtro
FILTRO=""
# FILTRO=$( aws ec2 describe-instances --query "Reservations[*].Instances[*].{ID:InstanceId,State:State.Name}" --output text --region ${REGION} | tr "\t" ":" | grep running | cut -d ":" -f1 | tr "\n" " " )
fi

#-.--.--.--.--.--.- MANDATORY COMMANDS -.--.--.--.--.--.-

if [ "${REGION}" == "" ] ; then
AVAILABILITY=us-east-2
fi

if [ "${AMI_ID}" == "" ] ; then
AMI_ID=$( )
fi

if [ "${BUNDLE}" == "" ] ; then
BUNDLE=t2.micro
fi

#-.--.--.--.--.--.- OPTIONAL COMMANDS -.--.--.--.--.--.-

if [ "${KEYPAIR}" == "" ] ; then
KEYPAIR=public_pelonakeypair
fi


#Values updated 2021-11-03
ami_id=ami-0da7ba92c3c072475
bundle_id=t2.micro
seg_group_id=sg-094b9d82c2bb3a730
region=eu-west-3
subnet=subnet-0e87d124ae8907ae1
key_pair=farmacia2021_rsa
user_data=run_user_data.x
instance_profile=snsaccess-brqxinstances

# PENDIENTE
#for instance in "${FILTRO}" ; do
if [ "${NUM_INSTANCES}" == "" -o "${NUM_INSTANCES}" == "1" ] ; then

__aws_create_ec2_inner
else
#-Multiples instancias

__aws_get_subnets

#La idea es que lance instancias en las redes publicas
while [ "${NUM_INSTANCES}" != "0" ] ; do

#Algoritmo para manejar el resto en bash
nn=$(( ${NUM_INSTANCES} % ${NUM_SUBNETS} ))  ;  let nn++
subnet=$( echo ${PUBLIC_SUBNETS} | cut -d " " -f${nn} )

#echo "lanzando subred ${NUM_INSTANCES} - ${nn} en ${subnet}"

__aws_create_ec2_inner

let NUM_INSTANCES--
done

fi

fi
}

