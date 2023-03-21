#!/bin/bash
#
# Script version 0.0.1
#
# Listado de los clusters de ECS
# alias awlefs

# awdy -> aws dynamodb
#awdyl
aws_dynamodb_list_tables()
{
VER="0.0.1"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "   Listado de tablas de DynamoDb  [$VER]	    			             		"
echo "=========================================================="
echo "Format  : awdyl | aws_dynamodb_list_tables [REGION]                     "
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
echo "       Listado de tablas de DynamoDb                  "
echo "--==--==--==--==--==--==--==--==--==--==--==--==--==--"

# aws dynamodb list-tables --region eu-west-1 --output text | tr "\t" " " | cut -d " " -f2
aws dynamodb list-tables --region ${aws_region_inner} --output text | tr "\t" " " | cut -d " " -f2 


echo "------------------------------------------------------"

#----====----====----====----====----====----====----====----====
#              F I N    D E   L A    L O G I C A 
#----====----====----====----====----====----====----====----====

fi

fi
}
