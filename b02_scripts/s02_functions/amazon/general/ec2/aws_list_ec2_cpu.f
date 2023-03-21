#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Farmacia Zaragoza - Brqx Architectures - Rct - 2022
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Version Fichero : v0.0.3 -- Junio 2022
#
# Listado de instancias EC2
#-------------------------------------------------------------------

# alias aw2l

aws_list_ec2()
{
VER="0.0.3"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Listado de instancias ec2 pasadas por parametro [$VER]						"
echo "=========================================================="
echo "Format  : aw2l | aws_list_ec2 [REGIONS|TAGS TAG_NAME TAG_VALUE]                         "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

OPTION=$1
FILTER=$2



# Opciones de funcionamiento
# Default --> Para las instancias de la region indicada o de la region actual
# REGIONS --> Para todas las instancias de todas las regiones
# TAGS    --> Para las instancias del tag indicado de todas las regiones


#Manage Tmp FIle
__tmp_file

if [ "${CURRENT_REGION}" == "" ] ; then
CURRENT_REGION="eu-west-1"
fi

if [ "${OPTION}" == "" ] ; then
OPTION=${CURRENT_REGION}
fi

if [ "${FILTER}" == "" ] ; then
FILTER="ami"
fi


case ${OPTION} in

REGIONS)
# List of instances of any region

__regions


for region in ${REGIONS} ; do

#a01:amazon_linux:nano_2_0:us-east-2:us-east-2a:stopped


# La salida se ordena por los identificadores
#echo "$region"
aws ec2 describe-instances --query "Reservations[*].Instances[*].{aID:InstanceId,bImage:ImageId,cType:InstanceType,key:KeyName,sState:State.Name,gAZ:Placement.AvailabilityZone,dIP:PrivateIpAddress,ePuIP:PublicIpAddress}" --output text --region ${region} | tr "\t" ":" 

done | grep ${FILTER}

;;
CURRENT)
# List of instances of one region
aws ec2 describe-instances --query "Reservations[*].Instances[*].{aID:InstanceId,bImage:ImageId,cType:InstanceType,key:KeyName,sState:State.Name,gAZ:Placement.AvailabilityZone,dIP:PrivateIpAddress,ePuIP:PublicIpAddress}" --output text --region ${CURRENT_REGION} | tr "\t" ":" 
;;

*)
# List of instances of one region
aws ec2 describe-instances --query "Reservations[*].Instances[*].{aID:InstanceId,bImage:ImageId,cType:InstanceType,key:KeyName,sState:State.Name,gAZ:Placement.AvailabilityZone,dIP:PrivateIpAddress,ePuIP:PublicIpAddress}" --output text --region ${OPTION} | tr "\t" ":" 
;;
esac


fi
}

