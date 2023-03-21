#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

# Alias awze
aws_alias_info_efs()
{
VER="0.0.0.1"
FEC="2022-Jul"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informacion de los alias definidos en Amazon EFS en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : awze | aws_alias_info_efs               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

echo "--==--==--==--==--==--==--==--==--==--==--"
echo "Alias definidos Amazon EFS en arquitectura Brqx ${VER} - ${FEC} - Nivel 0"
echo "------------------------------------------"

set_text_length 40


#---------------- I N I T  ------------------

#TEXT="$(alias ti)"
#echo "$(format_text_length ${TEXT})  - ${yellow}Inicia los proveedores de Amazon"$(textreset)

#---------------- P L A N  ------------------



echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

