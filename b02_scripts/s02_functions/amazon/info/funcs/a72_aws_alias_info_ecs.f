#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

# Alias awze
aws_alias_info_ecs()
{
VER="0.0.0.1"
FEC="2022-Ago"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informacion de los alias definidos en Amazon ECS en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : awze | aws_alias_info_ecs               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

echo "--==--==--==--==--==--==--==--==--==--==--"
echo "Alias definidos Amazon ECS en arquitectura Brqx ${VER} - ${FEC} - Nivel 0"
echo "------------------------------------------"

set_text_length 40

#---------------- E C S   ------------------

#Amazon ECS - awc
# alias awc="aws ecs "
TEXT="$(alias awc)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias principal de Aws ECS"$(textreset)

#Aws ECS List Clusters
# alias awcl="aws_ecs_list_clusters"
TEXT="$(alias awcl)"
echo "$(format_text_length ${TEXT})  - ${yellow}Lista los Clusters ECS de Amazon"$(textreset)

#Aws ECS List Task
# alias awct="aws_ecs_list_task"
TEXT="$(alias awct)"
echo "$(format_text_length ${TEXT})  - ${yellow}Lista las Tareas de un cluster dado en Amazon ECS"$(textreset)

#Aws ECS Describe Tast - Get Fargate IP
# alias awcd="aws_ecs_describe_task_get_ip"
TEXT="$(alias awcd)"
echo "$(format_text_length ${TEXT})  - ${yellow}Informa de la IP de la tarea/s de Fargate"$(textreset)



echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

