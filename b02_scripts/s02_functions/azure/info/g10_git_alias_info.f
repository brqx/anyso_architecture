#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

azure_alias_info()
{
VER="0.0.0.1"
FEC="2022-Jul"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informacion de los alias definidos en Git en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : gic | azure_commit INFO               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Establecemos el size del texto deseado para la salida
set_text_length 30

echo "--==--==--==--==--==--==--==--==--==--==--"
echo "Alias definidos en arquitectura Brqx ${VER} - ${FEC}"
echo "------------------------------------------"

TEXT="$(alias gia)"
echo "$(format_text_length ${TEXT})  - ${yellow}Actualizamos Git con el contenido de la carpeta actual"$(textreset)

#------------- C O M M I T  ------------------

TEXT="$(alias gic)"
echo "$(format_text_length ${TEXT})  - ${yellow}Hacemos un commit en Git"$(textreset)

# Commit with message
alias gicm="gic -am"

alias gicam="gic -am 'Changes automatically approved"


TEXT="$(alias gim)"
echo "$(format_text_length ${TEXT})  - ${yellow}Hacemos un merge de la rama indicada en la rama actual"$(textreset)


#------------- P U S H    O R I G I N  ------------------
# Habilitamos la resolucion de indicar la rama actual

TEXT="$(alias gip)"
echo "$(format_text_length ${TEXT})  - ${yellow}Habilitamos la resolucion de indicar la rama actual"$(textreset)

#------------- P U L L    O R I G I N  ------------------
# Recuperamos/actualizamos la rama actual

TEXT="$(alias gio)"
echo "$(format_text_length ${TEXT})  - ${yellow}Recuperamos/actualizamos la rama actual"$(textreset)

#------------- C H E C K O U T   ------------------
# Cambio de rama - Ajustando el path

TEXT="$(alias gik)"
echo "$(format_text_length ${TEXT})  - ${yellow}Cambio de rama - Ajustando el path"$(textreset)


echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

