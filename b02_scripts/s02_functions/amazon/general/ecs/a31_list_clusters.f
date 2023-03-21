#!/bin/bash
#
# Script version 0.0.1
#
# Listado de los clusters de ECS
# alias awlefs

# awe -> aws ecr
# awc -> aws ecs
#awec
aws_ecs_list_clusters()
{
VER="0.0.1"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "   Listado de clusters de ECS // Fargate  [$VER]	    			             		"
echo "=========================================================="
echo "Format  : awcl | aws_ecs_list_clusters [REGION]                     "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Tiene dos modos de funcionamiento
# 1. Pasando el parametro Region
#
# 2. Usando la variable aws_region

REGION=$1

__check_aws_region_account


if [ "${aws_region_inner}" != "" ] ; then

#----====----====----====----====----====----====----====----====
#           I N I C I O    D E   L A    L O G I C A 
#----====----====----====----====----====----====----====----====

echo "------------------------------------------------------"
echo "       Listado de cluster de ECS // Fargate           "
echo "--==--==--==--==--==--==--==--==--==--==--==--==--==--"

# aws ecs list-clusters --region eu-west-1 | grep arn | tr -s " " | cut -d '"' -f2
CLUSTER=$( aws ecs list-clusters --region ${aws_region_inner}  | grep arn | tr -s " " | cut -d '"' -f2 )

echo "${CLUSTER}"

echo "------------------------------------------------------"

#----====----====----====----====----====----====----====----====
#              F I N    D E   L A    L O G I C A 
#----====----====----====----====----====----====----====----====

fi

fi
}
