#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

tf_alias_info_command_large()
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

#  tf up --> Arrancar estructura no detach
TEXT="$(alias tfun)"
echo "$(format_text_length ${TEXT})  - ${yellow}Arrancar estructura no detach$(textreset)"

#  tf build --> Arrancar estructura no detach sin usar cache
TEXT="$(alias tfb)"
echo "$(format_text_length ${TEXT})  - ${yellow}Arrancar estructura no detach sin usar cache$(textreset)"

#  tf up --> Arrancar estructura no detach sin cache y forzando la recreación
TEXT="$(alias tfuf)"
echo "$(format_text_length ${TEXT})  - ${yellow}Arrancar estructura no detach sin usar cache recreando"$(textreset)

#  tf up --> Borrar la cache y ejecutar terraform compose
TEXT="$(alias tfu)"
echo "$(format_text_length ${TEXT})  - ${yellow}Arrancar estructura detach sin usar cache"$(textreset)

#  tf up --> Arrancar estructura no detach
TEXT="$(alias tfud)"
echo "$(format_text_length ${TEXT})  - ${yellow}Arrancar estructura no detach sin usar cache"$(textreset)

TEXT="$(alias tfuv)"
echo "$(format_text_length ${TEXT})  - ${yellow}Arrancar estructura verbose"$(textreset)

# tfur --> Inicia borrando los contenedores huerfanos
TEXT="$(alias tfur)"
echo "$(format_text_length ${TEXT})  - ${yellow}Arrancar estructura borrando contenedores huerfanos"$(textreset)

#  tf stop --> Detiene estructura
TEXT="$(alias tfs)"
echo "$(format_text_length ${TEXT})  - ${yellow}Para/destruye estructura"$(textreset)

#  tf port --> Muestra los puertos usados
TEXT="$(alias tfp)"
echo "$(format_text_length ${TEXT})  - ${yellow}MuestraPuertos usados"$(textreset)


echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

