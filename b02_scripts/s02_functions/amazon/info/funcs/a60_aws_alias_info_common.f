#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

# Alias awzv
aws_alias_info_common()
{
VER="0.0.0.1"
FEC="2022-Jul"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informacion de los alias definidos en Amazon Common en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : awzcommon | aws_alias_info_common               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

echo "--==--==--==--==--==--==--==--==--==--==--"
echo "Alias definidos Amazon Common en arquitectura Brqx ${VER} - ${FEC} - Nivel 0"
echo "------------------------------------------"

set_text_length 40

#---------------- V E R S I O N  ------------------

#alias awv="aws --version"
TEXT="$(alias awv)"
echo "$(format_text_length ${TEXT})  - ${yellow}Informa de la versión del cliente de Aws"$(textreset)

#---------------- C O N F I G U R E  ------------------

# Amazon Aws Configure - Por seguridad no se debe usar
#alias awc="aws configure "
TEXT="$(alias awc)"
echo "$(format_text_length ${TEXT})  - ${yellow}Inicia la configuracion de amazon Aws - No recomendado-"$(textreset)

#---------------- I A M  ------------------

# Amazon AIM

#alias awi="aws iam "
TEXT="$(alias awi)"
echo "$(format_text_length ${TEXT})  - ${yellow}Provee servicios de autenticacion - Amazon IAM"$(textreset)

#---------------- S S H   ------------------

#alias awssh="aws_ssh"
TEXT="$(alias awssh)"
echo "$(format_text_length ${TEXT})  - ${yellow}Inicia conexion SSH contra instancia EC2"$(textreset)


echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

