#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

dc_alias_info_large()
{
VER="0.0.0.1"
FEC="2022-Jul"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informacion de los alias definidos en Docker Compose en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : dcz | dc_alias_info               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

echo "--==--==--==--==--==--==--==--==--==--==--"
echo "Alias definidos Docker Compose en arquitectura Brqx ${VER} - ${FEC} - Nivel 0"
echo "------------------------------------------"

set_text_length 60

#  dc up --> Arrancar estructura no detach
TEXT="$(alias dcun)"
echo "$(format_text_length ${TEXT})  - ${yellow}Arrancar estructura no detach$(textreset)"

#  dc build --> Arrancar estructura no detach sin usar cache
TEXT="$(alias dcb)"
echo "$(format_text_length ${TEXT})  - ${yellow}Arrancar estructura no detach sin usar cache$(textreset)"

#  dc up --> Arrancar estructura no detach sin cache y forzando la recreación
TEXT="$(alias dcuf)"
echo "$(format_text_length ${TEXT})  - ${yellow}Arrancar estructura no detach sin usar cache recreando"$(textreset)

#  dc up --> Borrar la cache y ejecutar docker compose
TEXT="$(alias dcu)"
echo "$(format_text_length ${TEXT})  - ${yellow}Arrancar estructura detach sin usar cache"$(textreset)

#  dc up --> Arrancar estructura no detach
TEXT="$(alias dcud)"
echo "$(format_text_length ${TEXT})  - ${yellow}Arrancar estructura no detach sin usar cache"$(textreset)

TEXT="$(alias dcuv)"
echo "$(format_text_length ${TEXT})  - ${yellow}Arrancar estructura verbose"$(textreset)

# dcur --> Inicia borrando los contenedores huerfanos
TEXT="$(alias dcur)"
echo "$(format_text_length ${TEXT})  - ${yellow}Arrancar estructura borrando contenedores huerfanos"$(textreset)

#  dc stop --> Detiene estructura
TEXT="$(alias dcs)"
echo "$(format_text_length ${TEXT})  - ${yellow}Para/destruye estructura"$(textreset)

#  dc port --> Muestra los puertos usados
TEXT="$(alias dcp)"
echo "$(format_text_length ${TEXT})  - ${yellow}MuestraPuertos usados"$(textreset)


echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

