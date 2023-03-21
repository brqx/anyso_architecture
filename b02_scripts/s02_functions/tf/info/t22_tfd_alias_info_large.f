#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

tfc_alias_info_composer_large()
{
VER="0.0.0.1"
FEC="2022-Jul"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informacion de los alias definidos en Terraform Compose en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : tfz | tf_alias_info               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

echo "--==--==--==--==--==--==--==--==--==--==--"
echo "Alias definidos Terraform Compose en arquitectura Brqx ${VER} - ${FEC} - Nivel 0"
echo "------------------------------------------"

set_text_length 60

#  tf init --> Inicializar los proveedores
TEXT="$(alias tfci)"
echo "$(format_text_length ${TEXT})  - ${yellow}Inicializar los proveedores$(textreset)"

#  tf plan --> Planficacion
TEXT="$(alias tfcp)"
echo "$(format_text_length ${TEXT})  - ${yellow}Informar sobre la planificacion"$(textreset)

#  tf apply --> Aplicar los cambios
TEXT="$(alias tfca)"
echo "$(format_text_length ${TEXT})  - ${yellow}Aplicar los cambios en la estructura"$(textreset)

#  tf show --> Mostrar la infraestructura definida
TEXT="$(alias tfcs)"
echo "$(format_text_length ${TEXT})  - ${yellow}Mostrar la infraestructura definida"$(textreset)

#  tf destroy --> Destruir la infraestructura definida
TEXT="$(alias tfcd)"
echo "$(format_text_length ${TEXT})  - ${yellow}Destruid la infrestructura deifinda"$(textreset)

# TF validate
TEXT="$(alias tfcv)"
echo "$(format_text_length ${TEXT})  - ${yellow}Validacion sintactica del codigo"$(textreset)

# tfcw --> Gestion de Workspaces
TEXT="$(alias tfcw)"
echo "$(format_text_length ${TEXT})  - ${yellow}Gestion de Workspaces"$(textreset)

#  tf state --> Reporta del estado de Terraform
TEXT="$(alias tfcs)"
echo "$(format_text_length ${TEXT})  - ${yellow}REporta el estado de Terraform"$(textreset)

#  tf format --> Formatea el codigo Terraform (Linting)
TEXT="$(alias tfcf)"
echo "$(format_text_length ${TEXT})  - ${yellow}Formatea el codigo de Terraform"$(textreset)


echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

