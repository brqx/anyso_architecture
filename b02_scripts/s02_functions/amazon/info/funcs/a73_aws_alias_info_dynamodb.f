#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

# Alias awze
aws_alias_info_dynamodb()
{
VER="0.0.0.1"
FEC="2023-Mar"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informacion de los alias definidos en Amazon DynamoDb en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : awze | aws_alias_info_ecs               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

echo "--==--==--==--==--==--==--==--==--==--==--"
echo "Alias definidos Amazon DynamoDb en arquitectura Brqx ${VER} - ${FEC} - Nivel 0"
echo "------------------------------------------"

set_text_length 40

#---------------- E C S   ------------------

#Amazon ECS - awc
# alias awdy="aws dynamodb "
TEXT="$(alias awdy)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias principal de Aws DynamoDb"$(textreset)

#Aws ECS List Clusters
# alias awdyl="aws_dynamodb_list_tables"
TEXT="$(alias awdyl)"
echo "$(format_text_length ${TEXT})  - ${yellow}Lista los Tablas DynamoDb de Amazon"$(textreset)

#Aws ECS List Task
# alias awdys="aws_dynamodb_scan_table"
TEXT="$(alias awdys)"
echo "$(format_text_length ${TEXT})  - ${yellow}Scan de una tabla de DynamoDb Amazon"$(textreset)


echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

