#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

d_alias_info_short()
{
VER="0.0.0.1"
FEC="2022-Jul"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informacion de los alias definidos en Docker Compose en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : doz | d_alias_info_short               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

echo "--==--==--==--==--==--==--==--==--==--==--"
echo "Alias definidos Docker en arquitectura Brqx ${VER} - ${FEC} - Nivel 0"
echo "------------------------------------------"

set_text_length 40


# docker search --> buscar
TEXT="$(alias ds)"
echo "$(format_text_length ${TEXT})  - ${yellow}docker search --> buscar"$(textreset)

# docker pull --> descargar
TEXT="$(alias dp)"
echo "$(format_text_length ${TEXT})  - ${yellow}docker pull --> descargar"$(textreset)

# docker create | add --> create container
TEXT="$(alias da)"
echo "$(format_text_length ${TEXT})  - ${yellow}docker create | add --> create container"$(textreset)

# docker inspect --> Inspeccion de contenedores
TEXT="$(alias dip)"
echo "$(format_text_length ${TEXT})  - ${yellow}docker inspect --> Inspeccion de contenedores"$(textreset)

#  docker ps - current process filtered by function
# alias dps="dp_filter "
TEXT="$(alias dps)"
echo "$(format_text_length ${TEXT})  - ${yellow}docker ps --> Filtro de procesos con Docker"$(textreset)

# Super funcion que borra todos los contenedores y imagenes no usadas que han quedado
# alias drma="drmall"
TEXT="$(alias drma)"
echo "$(format_text_length ${TEXT})  - ${yellow}docker rm ...  --> Super Funcion. Elimina contenedores e imagenes zombies (auto generadas)"$(textreset)

#  docker remove images
# alias dirm="d image rm "
# alias drmi="dirm "
TEXT="$(alias drmi)"
echo "$(format_text_length ${TEXT})  - ${yellow}docker image rm --> Elimina imagenes de Docker"$(textreset)

# docker commit --> create image from a container
TEXT="$(alias dm)"
echo "$(format_text_length ${TEXT})  - ${yellow}docker commit --> Generar imagen de un contenedor Docker"$(textreset)

echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

