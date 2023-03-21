#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

# Alias tfzt
tfc_alias_info_composer()
{
VER="0.0.0.1"
FEC="2022-Jul"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informacion de los alias definidos en Terraform Compose en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : tfdz | tfd_alias_info_composer               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

echo "--==--==--==--==--==--==--==--==--==--==--"
echo "Alias definidos Terraform Compose en arquitectura Brqx ${VER} - ${FEC} - Nivel 0"
echo "------------------------------------------"

set_text_length 40


#---------------- I N I T  ------------------

TEXT="$(alias tfci)"
echo "$(format_text_length ${TEXT})  - ${yellow}Inicia los proveedores de Terraform"$(textreset)

#---------------- A P P L Y  ------------------

TEXT="$(alias tfca)"
echo "$(format_text_length ${TEXT})  - ${yellow}Aplica/Crea los cambios de infraestructura planificados"$(textreset)

#--------------- D E S T R O Y ---------------

TEXT="$(alias tfcd)"
echo "$(format_text_length ${TEXT})  - ${yellow}Destruye la infraestructura de Terraform"$(textreset)

#------------- V A L I D A T E  ------------------

TEXT="$(alias tfcv)"
echo "$(format_text_length ${TEXT})  - ${yellow}Valida la sintaxis del codigo Terraform"$(textreset)

echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

