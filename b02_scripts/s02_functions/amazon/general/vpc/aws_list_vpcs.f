#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Farmacia Zaragoza - Brqx Architectures - Rct - 2021
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Version Fichero : v0.0.1
#
# Listado de VPCs de AWS
# alias aw2lvpc
#-------------------------------------------------------------------

#-Funciones internas de gestion de arquitectura uniforme

__aws_manage_regions_inner()
{
if    [ "${REGIONS}" == "" ] ; then
REGIONS=$(aws ec2 describe-regions --output text | cut -f4 | tr "\n" " " )
fi
}

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

__aws_manage_region_inner()
{

#1- Si no se ha pasado region cogemos la actual
if    [ "${REGION}" == "" ] ; then
# Call to regions hook
__regions
REGION=${CURRENT_REGION}
fi
}

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

#Listado de las VPC de una region
__aws_list_vpc_per_region_inner()
{

aws ec2 describe-vpcs --region $REGION --output text > ${TMP_FILE}

NAMES=$(cat ${TMP_FILE} | grep TAGS | tr "\t" " " | cut -d " " -f3 | tr "\n" " ")
CIDRS=$(cat ${TMP_FILE} | grep VPCS | tr "\t" " " | cut -d " " -f2 | tr "\n" " ")
VPIDS=$(cat ${TMP_FILE} | grep VPCS | tr "\t" " " | cut -d " " -f8 | tr "\n" " ")

c=1
for cidr in ${CIDRS} ; do
name=$( echo ${NAMES} | cut -d " " -f${c}  )
vpid=$( echo ${VPIDS} | cut -d " " -f${c}  )

# Para cada CIDR (acl y tabla de rutas)
if [ "${vpid}" != "" ] ; then
ACLID=AA
RTBID=BB
ACLID=$(aws ec2 describe-network-acls --filter Name=vpc-id,Values=${vpid}  --output yaml | grep NetworkAclId | cut -d " " -f4 | tr "\n" " " | tr -s " ")
RTBID=$(aws ec2 describe-route-tables --filter Name=vpc-id,Values=${vpid}  --output yaml | grep RouteTableId | cut -d " " -f4 | tr "\n" " " | tr -s " ")
fi
echo "${name} : ${cidr} : ${vpid} :${ACLID}:${RTBID}"

let c++

done

}

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

#Funcion Publica - Listado de VPC
aws_list_vpcs()
{
VER="0.0.5"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Listado de vpcs existentes en la region actual [$VER]						"
echo "=========================================================="
echo "Format  : aw2lvpc | aws_list_vpc [region|ALL]                         "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

#Casos de funcionamiento 

# 1- No se pasa nada -- > VPCs de la region actual

# 2- Se pasa la region

# 3- ALL --> se sacan todas las regiones

# Mostrar las VPCs de la region actual

__tmp_file

REGION=$1

#Script general de comprobacion de regiones  - Comun para todas las funciones

__aws_manage_region_inner

#0- Cabecera

echo "NAME : CIDR : VPCID : ACL : ROUTE_TABLE(s)"
echo "-----------------------------------------------------"

#-1- Caso todas las regiones
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
if   [ "${REGION}" == "ALL" ] ; then

# Review Regions
__aws_manage_regions_inner


for region in ${REGIONS} ; do
aws_list_vpc_per_region
done

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
else
#2- Caso region actual o region pasada por parametro

if [ "${REGION}" != "" ] ; then
aws_list_vpc_per_region
fi

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
# End IF_REGIONES
fi

echo "-----------------------------------------------------"

fi
}

# Aws - Vpc - List - 2021