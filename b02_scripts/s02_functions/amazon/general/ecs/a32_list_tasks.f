#!/bin/bash
#
# Script version 0.0.1
#
# Listado de los clusters de ECS
# alias awlefs

# awe -> aws ecr
# awc -> aws ecs
#awec
aws_ecs_list_tasks()
{
VER="0.0.1"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "   Listado de tareas de clusters de ECS // Fargate  [$VER]	    			             		"
echo "=========================================================="
echo "Format  : awct | aws_ecs_list_tasks [REGION]                     "
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

echo "------------------------------------------------------------------"
echo " Listado de tareas del servicio del cluster de ECS // Fargate     "
echo "--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--"

aws_ecs_list_clusters ${REGION}

if [ "${CLUSTER}" != "" ] ; then

# aws ecs list-tasks --cluster=$CLU --region eu-west-1 | grep arn | tr -s " " | cut -d '"' -f2
TASK=$( aws ecs list-tasks --cluster=${CLUSTER} --region ${aws_region_inner} | grep arn | tr -s " " | cut -d '"' -f2 )

echo "${TASK}"

else

echo "No hay definido Cluster"

fi

echo "------------------------------------------------------"

#----====----====----====----====----====----====----====----====
#              F I N    D E   L A    L O G I C A 
#----====----====----====----====----====----====----====----====

fi

fi
}
