#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

# Alias awszt
aws_alias_info_vault()
{
VER="0.0.0.1"
FEC="2022-Jul"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informacion de los alias definidos en Amazon Vault en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : awzv | aws_alias_info_vault               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

echo "--==--==--==--==--==--==--==--==--==--==--"
echo "Alias definidos Amazon  Vault en arquitectura Brqx ${VER} - ${FEC} - Nivel 0"
echo "------------------------------------------"

set_text_length 40


#---------------- M A I N  ------------------

#Amazon Vault Conexion 1h

TEXT="$(alias awva)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias principal de Aws Vault"$(textreset)

#---------------- L I S T ------------------

#Amazon Vault Conexion 1h

TEXT="$(alias awval)"
echo "$(format_text_length ${TEXT})  - ${yellow}Listamos las conexiones de Aws Vault"$(textreset)


#---------------- E X E C   ------------------

#Amazon Vault Conexion 1h

# alias awv="aws-vault exec "
TEXT="$(alias awva)"
echo "$(format_text_length ${TEXT})  - ${yellow}Ejecuta AWS Vault con un perfil dado para 1h"$(textreset)

#---------------- E X E C  D ------------------

# Este tiene que ser una funcion
# alias awvd="aws_vault_duration="
TEXT="$(alias awvd)"
echo "$(format_text_length ${TEXT})  - ${yellow}Ejecuta AWS Vault con un perfil dado para la duracion indicada"$(textreset)

# Funcionalidad Conexion 3h

#---------------- E X E C  3H ------------------

# alias awv3="awvd 3h "
TEXT="$(alias awv3)"
echo "$(format_text_length ${TEXT})  - ${yellow}Ejecuta AWS Vault con un perfil dado para 3h"$(textreset)

#---------------- D I S C O N E C T   ------------------

# Funcionalidad DexConexion

# alias awvu="unset AWS_VAULT"
TEXT="$(alias awvu)"
echo "$(format_text_length ${TEXT})  - ${yellow}Resetea la configuracion de Vault para que se pueda volver a usar"$(textreset)



echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

