#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Farmacia Zaragoza - Brqx Architectures - Rct - 2021
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Version Fichero : v0.0.0.3 -- Noviembre 2021
#
# Listado de instancias EC2
#-------------------------------------------------------------------

# alias aw2l

aws_list_cf()
{
VER="0.0.0.5"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Listado de stacks (pilas) cf de la region indicada [$VER]						"
echo "=========================================================="
echo "Format  : awfl | aws_list_cf [REGIONS|TAGS TAG_NAME TAG_VALUE]                         "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

OPTION=$1
TAG_NAME=$2
TAG_VALUE=$3

# Opciones de funcionamiento
# Default --> Para las instancias de la region indicada o de la region actual
# REGIONS --> Para todas las instancias de todas las regiones
# TAGS    --> Para las instancias del tag indicado de todas las regiones


#Manage Tmp FIle
__tmp_file

echo "Listado Pilas (STACKS) de CloudFormation (CF) - ${VER}"
echo "---------------------------------------------"

case ${OPTION} in

REGIONS)
# List of instances of any region

__regions

# Cuidado con los bucles FOR - al entrecomillarlos se genera una sola expresion

for REGION in ${REGIONS} ; do

#for REGION in "${REGIONS}" ; do

#a01:amazon_linux:nano_2_0:us-east-2:us-east-2a:stopped


# La salida se ordena por los identificadores

# echo "Chequeando ${REGION}"

aws cloudformation list-stacks --region "${REGION}" --output text > ${TMP_FILE} 2> /dev/null
STATUS=$?

# echo "Estado : ${STATUS}"

STACK_NAME=$( cat ${TMP_FILE} | tr "\t" " " |  tr -s " " | grep "CREATE_COMPLETE" | cut -d " " -f4 )

#echo "$i"

if [ "${STACK_NAME}" != "" ] ; then
echo "${REGION} - ${STACK_NAME}"
fi

done

;;
*)
# List of instances of one region

#Manage Regions
__region

aws cloudformation list-stacks --output text > ${TMP_FILE}

STACK_NAME=$( cat ${TMP_FILE} | tr "\t" " " |  tr -s " " | grep CREATE_COMPLETE | cut -d " " -f4 )

echo "ONE ${REGION} - ${STACK_NAME}"
;;

esac

echo "---------------------------------------------"

# Vaciado de variables conflictivas

REGION=

fi
}

