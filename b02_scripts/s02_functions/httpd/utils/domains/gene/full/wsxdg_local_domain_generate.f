#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.8" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- wsxdg
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- wsdg
#-- ws_getline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Genera el fichero de dominios para usarse en HaProxy
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create haproxy domains structure
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E wsxdg 	-- Genera la estructura de dominios para usarse en HaProxy [domains.ful]
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 

wsxdg()
{
VER="0.0.8"								;QV="Brqx Agile Architecture 2016"
FUNC="wsfdg"

wsxdg_NFO="Genera un listado de dominios para servidores PROXY haproxy en arquitectura Brqx [$VER]"
wsxdg_FMT="wsxdg [file_waf] [file_loc]"
wsxdg_EXA="wsxdg file_waf"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wsxdg_NFO}" "${wsxdg_FMT}" "${wsxdg_EXA}"
#--------------------------------------------------------------------------------
else

#-Generate file structures for process
wsdg_create_file_structures

OUTOUT="CLEANX"

PROJECT_PATH="/brqi/"

#Hay que obtener el servidor

DOMAINS_FILE=$(        	find ${PROJECT_PATH} -type f -name "brqx.fulldom"     			| head -1                )


if [ "${DOMAINS_FILE}" != "" ] ; then
if [ -f "${DOMAINS_FILE}"    ] ; then
#--[01] - START [IF FINDLINE] ------------------------------------------------------------------
#Tenemos que iterar todos los dominios
#-1.Averiguar datos de los mismos
#-2.Averiguar los idiomas de los mismos
#-3.Indigar los subdominios definidos
#-4.Generar la estructura

##- NUEVO CHEQUEO NO DEBE SER UN PROXY
IP_DOMAIN_EBRQX="78.46.58.130"
IP_DOMAIN_FBRQX="88.198.7.135"

#-Only exist in Centos 6x
IP_SERVER=$( 		hostname -I 2> /dev/null | cut -d " " -f1  	)
if [ "${?}" != "0" ] ; then
IP_SERVER=$( 		hostname -i					  2> /dev/null	)
fi

if [ "${IP_SERVER}" == "${IP_DOMAIN_FBRQX}" -o  "${IP_SERVER}" == "${IP_DOMAIN_EBRQX}" 	] ; then
#STAIF04-- START [PROXY] --------------------------------------------------------------------

multi_line_normal "#Generando estructura multi dominios HaProxy (Nivel Global [domains.ful] Local [domains.map] )"

cont_domain=0					# Listado de dominios totales
cont_subdomain=0				# Listado de dominios totales
pointed_cont_domain=0			# Dominios apuntados al servidor
proxy_pointed_cont_domain=0		# Dominios apuntados al proxy
created_cont_domain=0			# Dominios con estructura generada
created_cont_subdomain=0		# Dominios con estructura generada


for domain in $( cat "${DOMAINS_FILE}" | grep -v "^#" | cut -d ":" -f1 ) ; do
#-For Proxy servers
wsdg $domain 
let cont_domain++

done

#                     1  2 3  4 5  6 7  8 9 10
prtyline_set_args_len 5 12 5 12 5 12 5 12 5 12

prtyline_set_line ' ' 'Generados' ' ' 'apuntados' ' ' 'creados' ' ' 'subdominos' ' ' 'subcreados'
HEADER_01="#${prtyline_set_line_OUT}"

prtyline_set_line ' ' ${cont_domain} ' ' ${pointed_cont_domain} ' ' ${created_cont_domain} ' ' ${cont_subdomain} ' ' ${created_cont_subdomain}
LINE_01="#${prtyline_set_line_OUT}"


echo "#$(linea_normal 	100)"		
echo "${HEADER_01}"
echo "#$(linea_caracter -==	100)"		
echo "${LINE_01}"
echo "#$(linea_alterna 	100)"

else

wdxdg_ERR="# PROBLEM ($FUNC): SERVER IS NOT PROXY - RUN BETTER wsfdg  "

#END_IF_[04]-- END [PROXY] ---------------------------------------------------------------------
fi
else
wdxdg_ERR="DANGER : MAIN DOMAN FILE DONT EXIST IN CLUSTER STRUCTURE  "

#--[01] - END [IF FINDLINE] --------------------------------------------------------------------
fi

else
wdxdg_ERR="DANGER : MAIN DOMAN FILE IS NOT DEFINED IN CLUSTER STRUCTURE  "

#--[01] - END [IF FINDLINE] --------------------------------------------------------------------
fi

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
multi_line_header "${wdxdg_ERR}"
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--

#END_IF_[01] - END Fin Funcion ------------------------------------------------------------------------
fi
}
