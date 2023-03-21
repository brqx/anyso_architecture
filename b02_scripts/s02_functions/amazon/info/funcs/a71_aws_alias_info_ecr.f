#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

# Alias awze
aws_alias_info_ecr()
{
VER="0.0.0.1"
FEC="2022-Ago"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informacion de los alias definidos en Amazon EFS en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : awzc | aws_alias_info_ecr               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

echo "--==--==--==--==--==--==--==--==--==--==--"
echo "Alias definidos Amazon ECR en arquitectura Brqx ${VER} - ${FEC} - Nivel 0"
echo "------------------------------------------"

set_text_length 40

#---------------- E C R  ------------------

#alias awe="aws ecr "
TEXT="$(alias awe)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias general de Amazon ECR"$(textreset)

#Aws ECR Connect
alias awec="aws_ecr_connect"
TEXT="$(alias awec)"
echo "$(format_text_length ${TEXT})  - ${yellow}Conectarse con Docker al repositorio de Amazon ECR"$(textreset)

#Aws ECR Tag
alias awet="aws_ecr_tag_latest"
TEXT="$(alias awet)"
echo "$(format_text_length ${TEXT})  - ${yellow}Generar TAG para Amazon ECR"$(textreset)

#Aws ECR Push
alias awep="aws_ecr_push"
TEXT="$(alias awep)"
echo "$(format_text_length ${TEXT})  - ${yellow}Subir Imagen al repositorio de Amazon ECR"$(textreset)
 

echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

