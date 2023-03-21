#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.8" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- wsfdg
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
#E wsfdg 	-- Genera la estructura de dominios para usarse en HaProxy [domains.ful]
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#-FULL DOMAIN GENERATE
wsfdg()
{
VER="0.0.8"								;QV="Brqx Agile Architecture 2016"

wsfdg_FUN="wsfdg"
wsfdg_NFO="Genera un listado de dominios para servidores haproxy en arquitectura Brqx para servidores NO Proxy [$VER]"
wsfdg_FMT="wsfdg"
wsfdg_EXA="wsfdg"

wsfdg_OUT=0
wsfdg_MSG=""
wsfdg_ERR=""

if [ "${1}" == "-?" ] ; then
#STA_IF_[01] - START [IF INICIO FUNCION] ----------------------------------------
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wsfdg_NFO}" "${wsfdg_FMT}" "${wsfdg_EXA}"
#--------------------------------------------------------------------------------
else

#-Generate file structures for process
wsdg_create_file_structures

PROJECT_PATH="/brqi/"

#Hay que obtener el servidor

DOMAINS_FILE=$(        	find ${PROJECT_PATH} -type f -name "brqx.fulldom"     			| head -1                )


if [ "${DOMAINS_FILE}" != "" ] ; then
#STA_IF_[02] - START [IF DOMAINS_FILE NOT NULL] --------------------------------------------------


if [ -f "${DOMAINS_FILE}"    ] ; then
#STA_IF_[03] - START [IF DOMAINS FILE EXIST] -----------------------------------------------------
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

if [ "${IP_SERVER}" != "${IP_DOMAIN_FBRQX}" -a  "${IP_SERVER}" != "${IP_DOMAIN_EBRQX}" 	] ; then
#STA_IF_[04]-- START [NOT PROXY] ------------------------------------------------------------------

header_dual_common "${wsfdg_NFO}" "${wsfdg_FMT}"  

cont_domain=0					# Listado de dominios totales
cont_subdomain=0				# Listado de dominios totales
pointed_cont_domain=0			# Dominios apuntados al servidor
proxy_pointed_cont_domain=0		# Dominios apuntados al proxy
created_cont_domain=0			# Dominios con estructura generada
created_cont_subdomain=0		# Dominios con estructura generada

for domain in $( cat "${DOMAINS_FILE}" | grep -v "^#" | cut -d ":" -f1 ) ; do
wsdg $domain 
let cont_domain++
done

#                     1  2 3  4 5  6 7  8 9 10
prtyline_set_args_len 5 12 5 12 5 12 5 12 5 12

prtyline_set_line ' ' 'Generados' ' ' 'apuntados' ' ' 'creados' ' ' 'subdominos' ' ' 'subcreados'
HEADER_01="#${prtyline_set_line_OUT}"

prtyline_set_line ' ' ${cont_domain} ' ' ${pointed_cont_domain} ' ' ${created_cont_domain} ' ' ${cont_subdomain} ' ' ${created_cont_subdomain}
LINE_01="#${prtyline_set_line_OUT}"

multi_line_normal_crc_alt "${HEADER_01}" "${LINE_01}"

else
wsfdg_ERR="# PROBLEM: SERVER IS A PROXY - RUN BETTER wsxdg  "
wsfdg_OUT=40
#END_IF_[04]-- START [NOT PROXY] ------------------------------------------------------------------
fi
else
wsfdg_ERR="# DANGER : MAIN DOMAN FILE DONT EXIST IN CLUSTER STRUCTURE  "
wsfdg_OUT=30
#ENDIF03--[01] - START [IF FINDLINE] ------------------------------------------------------------------
fi
else
wsfdg_ERR="# DANGER : MAIN DOMAN FILE IS NOT DEFINED IN CLUSTER STRUCTURE  "
wsfdg_OUT=20
#END_IF_[02]-- END [IF DOMAINS_FILE NOT NULL] ---------------------------------------------------------
fi

if [ "${wsfdg_OUT}" != "0" -a "${wsfdg_ERR}" != "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
wsfdg_ERR="# ${wsfdg_FUN}::##${wsfdg_ERR}"
multi_line_header "${wsfdg_ERR}"
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
fi

#END_IF_[01] - END Fin Funcion ------------------------------------------------------------------------
fi
}
