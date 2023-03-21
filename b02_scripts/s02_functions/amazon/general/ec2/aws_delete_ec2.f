#!/bin/bash
#
# Script version 0.0.1
#
# Borrado/Terminacion de instancias EC2
# alias aw2del


# Delete instances from region 
__inner_aws_delete_ec2_region()
{
# Inner version
__VER="0.0.1"
aws ec2 describe-instances --query "Reservations[*].Instances[*].{ID:InstanceId,State:State.Name}" --output text --region ${REGION} > ${TMP_FILE}

# Filtra las running y las pending
FILTRO=$( cat ${TMP_FILE} | tr "\t" ":" | egrep "running|pending" | cut -d ":" -f1 |  tr "\n" " " )

aws ec2 terminate-instances --instance-ids ${FILTRO} > ${TMP_FILE}

IID=$(cat ${TMP_FILE} | grep "InstanceId:" | cut -d " " -f4 | tr "\n" " ")

#done

echo "Terminando instancias con ID : ${IID} "


}

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==

aws_delete_ec2()
{
VER="0.0.1"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Borrado de instancias ec2 pasadas por parametro. Sin parametro para todas las de la zona [$VER]						"
echo "=========================================================="
echo "Format  : aw2del | aws_delete_ec2 [REGIONS|TAGS TAG_NAME TAG_VALUE] [listado instancias]                         "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

OPTION=$1
TAG_NAME=$2
TAG_VALUE=$3

FILTRO=$*

#Manage Tmp FIle
__tmp_file

#Vamos a tener una funcion intermedia que nos va a dar un filtro

# Opciones de funcionamiento
# Default --> Para las instancias de la region indicada o de la region actual
# REGIONS --> Para todas las instancias de todas las regiones
# TAGS    --> Para las instancias del tag indicado de todas las regiones

case ${OPTION} in

REGIONS)
# BEG DANGER !!! - TERMINATE ANY INSTANCES IN ANY REGIONS

__regions

for REGION in "${REGIONS}" ; do
__inner_aws_delete_ec2_region
done
;;
# END DANGER !!! - TERMINATE ANY INSTANCES IN ANY REGIONS
TAGS)
#Actuamos sobre una region o sobre las indicadas en el TAG (Pendiente)

# Como puede dar disntintos valores para que la query funcione hay que dar opcion 0 (None)
#FILTRO=$( aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId,Tags[?Key=='${TAG_NAME}'].Value | [0]]" --output text --region us-east-2 | grep ${TAG_VALUE} | tr  "\t"  " " | cut -d " " -f1 |  tr "\n" " "  )

echo "PEndiente"
;;
*)
if [ "${OPTION}" != "" ] ; then
REGION=$OPTION
else
REGION=${CURRENT_REGION}
fi
# Solo lo ejecutamos si se indica la region
if [ "${REGION}" != "" ] ; then
__inner_aws_delete_ec2_region
fi
;;

esac

#aw2 stop-instances --instance-ids  ${instance}

fi
}
