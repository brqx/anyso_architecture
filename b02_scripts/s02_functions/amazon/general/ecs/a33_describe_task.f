#!/bin/bash
#
# Script version 0.0.1
#
# Listado de los clusters de ECS
# alias awlefs

# awc -> aws ecs
#awec
aws_ecs_describe_task_get_ip()
{
VER="0.0.1"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "   Obtiene la IP privada de la/s Tareas de Fargate  [$VER]"
echo "=========================================================="
echo "Format  : awcd | aws_ecs_describe_task_get_ip [REGION]           "
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
echo "       Obtencion de la IP de la Tarea Fargate del servicio del luster de ECS // Fargate           "
echo "--==--==--==--==--==--==--==--==--==--==--==--==--==--"

aws_ecs_list_tasks ${REGION} &> /dev/null

# aws ecs describe-tasks --cluster=$CLU --task=$TAS --region eu-west-1 | grep value | grep "10." | grep -v "internal" | tr -s " " | cut -d '"' -f4
FARGATE_IP=$( aws ecs describe-tasks --cluster=${CLUSTER} --task=${TASK} --region ${aws_region_inner} | grep value | grep "10." | grep -v "internal" | tr -s " " | cut -d '"' -f4 )

echo "${FARGATE_IP}"

echo "------------------------------------------------------"

#----====----====----====----====----====----====----====----====
#              F I N    D E   L A    L O G I C A 
#----====----====----====----====----====----====----====----====

fi

fi
}

# Crear funciones clean
