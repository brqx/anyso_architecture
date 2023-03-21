#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.9" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#-------------------------------------------------------------------
#-- wsdi
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- wdom
#-- ws_gdcreate -  wsdi_print_lines
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Reporta informacion de conectividad del dominio indicado
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T report domain conectivity information
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P DOMAIN [DOMAIN_LIST_FILE]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E wsdi brqx.es	-- Reporta informacion de conectividad del dominio indicado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
wsdi()
{
VER="0.0.9"
FUNC="wsdi"

wsdi_NFO="Reporta informacion de conectividad del dominio en arquitectura Brqx [$VER]"
wsdi_FMT="wsdi [domain] [domains_file]"
wsdi_EXA="wsdi brqx.es"


wsdi_OUT=0
wsdi_MSG=""
wsdi_ERR=""

#STA_IF_[01] - Inicio Funcion --------------------------------------------------------------------
if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " " ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wsdi_NFO}" "${wsdi_FMT}" "${wsdi_EXA}"
#--------------------------------------------------------------------------------
else

IDSITE=${1}

PROJECT_PATH="/brqi/"

DOMAINS_FILE=$( 		find ${PROJECT_PATH} -type f -name "brqx.fulldom"     			 | head -1      )

#-Quiero informar de dominios que existen y que no por tanto no puedo filtrar si no se ha creado el dominio

ws_getdomainline
#wscd_OUT=$(expr  ${wscd_OUT} + ${ws_gdcreate_OUT})
#wscd_ERR="${wscd_ERR}${ws_gdcreate_ERR}"

wfulldomlite ${DOMAIN}

#-Si existe una linea es que se ha definido estructura para el dominio y ademas no esta duplicada

let real_cont_domain++

#-Domain exist in server
wsdi_MSG="Domain exist in server"

LOADSUBD=""   # Variable usada para saber si debemos mostrar los subdominios
LOADLANGS=""  # Variable usada para determinar si informamos de los idiomas
HEAD_LINE_INFORMATION=""
SHOW_WWW_DOMAIN=""

wsdi_show_lines  

#-Vaciado de variables
wsempty

#END_IF_[01] - END Fin Funcion ------------------------------------------------------------------------
fi
}
