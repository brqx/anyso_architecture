#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.2
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

# Alias tfzt
tf_alias_info_command()
{
VER="0.0.0.2"
FEC="2022-Aug"
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

set_text_length 40


#---------------- I N I T  ------------------

TEXT="$(alias ti)"
echo "$(format_text_length ${TEXT})  - ${yellow}Inicia los proveedores de Terraform"$(textreset)

#--------------- R E F R E S H ------------------
alias tr="tf refresh"
TEXT="$(alias tr)"
echo "$(format_text_length ${TEXT})  - ${yellow}Refresca/Recupera la informacion desde un bucket S3"$(textreset)


#---------------- P L A N  ------------------

TEXT="$(alias tp)"
echo "$(format_text_length ${TEXT})  - ${yellow}Prepara e informa sobre la planificacion de la futura infraestructura"$(textreset)

#---------------- A P P L Y  ------------------

TEXT="$(alias ta)"
echo "$(format_text_length ${TEXT})  - ${yellow}Aplica/Crea los cambios de infraestructura planificados"$(textreset)

TEXT="$(alias tta)"
echo "$(format_text_length ${TEXT})  - ${yellow}Tiempo que tarda en desplegarse la arquitectura"$(textreset)

#---------------- S H O W    ------------------

TEXT="$(alias ts)"
echo "$(format_text_length ${TEXT})  - ${yellow}Muestra la infraestructura actual"$(textreset)

#---------------- G R E P    ------------------

TEXT="$(alias tg)"
echo "$(format_text_length ${TEXT})  - ${yellow}Busca/Filtra parametros como la vpc_id de la infraestructura actual"$(textreset)

#--------------- D E S T R O Y ---------------

TEXT="$(alias td)"
echo "$(format_text_length ${TEXT})  - ${yellow}Destruye la infraestructura de Terraform"$(textreset)

TEXT="$(alias ttd)"
echo "$(format_text_length ${TEXT})  - ${yellow}Tiempo que tarda en destruirse la arquitectura"$(textreset)


#------------- V A L I D A T E  ------------------

TEXT="$(alias tv)"
echo "$(format_text_length ${TEXT})  - ${yellow}Valida la sintaxis del codigo Terraform"$(textreset)


#------------- W O R K S P A C E  ---------------

TEXT="$(alias tw)"
echo "$(format_text_length ${TEXT})  - ${yellow}Gestiona/Maneja workspaces con Terraform"$(textreset)

#------------- S T A T E  ---------------

TEXT="$(alias tt)"
echo "$(format_text_length ${TEXT})  - ${yellow}Informa del estado actual de terraform en la infraestructura"$(textreset)

#------------- M A K E    F O R M A T   |   L I N T   ---------------

TEXT="$(alias tff)"
echo "$(format_text_length ${TEXT})  - ${yellow}Formatea (LINT) el codigo terraform para que sea mas legible"$(textreset)


echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

