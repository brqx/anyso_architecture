#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.2
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

amazon_alias_info()
{
VER="0.0.0.3"
FEC="2023-Mar"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informacion de los alias definidos en Amazon en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : az | amazon_alias_info               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Establecemos el size del texto deseado para la salida
set_text_length 50

echo "--==--==--==--==--==--==--==--==--==--==--"
echo "Alias definidos Amazon Aws en arquitectura Brqx ${VER} - ${FEC} - Nivel 0"
echo "------------------------------------------"

# Alias VPC - 61
#alias awzv="aws_alias_info_vpc"
TEXT="$(alias awzv)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias Amazon VPC"$(textreset)

# Alias EC2 - 62
#alias awz2="aws_alias_info_ec2"
TEXT="$(alias awz2)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias Amazon EC2"$(textreset)

# Alias S3  - 63
#alias awz3="aws_alias_info_s3"
TEXT="$(alias awz3)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias Amazon S3"$(textreset)

# Alias EFS - 64
#alias awzf="aws_alias_info_efs"
TEXT="$(alias awzf)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias Amazon EFS"$(textreset)

# Alias ECR - 64
#alias awze="aws_alias_info_ecr"
TEXT="$(alias awze)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias Amazon ECR"$(textreset)

# Alias ECS - 64
#alias awzc="aws_alias_info_ecs"
TEXT="$(alias awzc)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias Amazon ECS"$(textreset)

# Alias ECS - 71
#alias awzdy="aws_alias_info_dynamodb"
TEXT="$(alias awzdy)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias Amazon DynamoDb"$(textreset)

# Alias AWS VAULT  - 65
#alias awzva="aws_alias_info_vault"
TEXT="$(alias awzva)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias Amazon Aws Vault"$(textreset)

# Alias Light Sail - 66
#alias awzl="aws_alias_info_lightsail"
TEXT="$(alias awzl)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias Amazon LightSail"$(textreset)

# Alias Cloud Formation - 67
#alias awzcf="aws_alias_info_cf"
TEXT="$(alias awzcf)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias Amazon Cloud Formation"$(textreset)

echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

