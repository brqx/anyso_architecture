#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

# Alias awzv
aws_alias_info_vpc()
{
VER="0.0.0.1"
FEC="2022-Jul"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informacion de los alias definidos en Amazon VPC en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : awvz | aws_alias_info               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

echo "--==--==--==--==--==--==--==--==--==--==--"
echo "Alias definidos Amazon VPC en arquitectura Brqx ${VER} - ${FEC} - Nivel 0"
echo "------------------------------------------"

set_text_length 40


#---------------- I N I T  ------------------

TEXT="$(alias ti)"
echo "$(format_text_length ${TEXT})  - ${yellow}Inicia los proveedores de Amazon"$(textreset)

#---------------- P L A N  ------------------



echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

