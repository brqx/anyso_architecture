#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.9" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- d-wsldg-
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- wsdg - wsdg_create_file_structures
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
#E wsldg 	-- Genera la estructura de dominios para usarse en HaProxy a nivel local [domains.map]
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wsldg()
{
VER="0.0.9"								;QV="Brqx Agile Architecture 2016"

wsldg_FUN="wsldg"
wsldg_NFO="Genera un listado de dominios para servidores haproxy [$VER]"
wsldg_FMT="wsldg"
wsldg_EXA="wsldg"

wsldg_OUT=0
wsldg_MSG=""
wsldg_ERR=""


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wsldg_NFO}" "${wsldg_FMT}" "${wsldg_EXA}"
#--------------------------------------------------------------------------------
else

#-Generate file structures for process
wsdg_create_file_structures

ws
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

header_dual_common "${wsldg_NFO}" "${wsldg_FMT}"

cont_domain=0					        # Listado de dominios totales
cont_subdomain=0				      # Listado de dominios totales
pointed_cont_domain=0			    # Dominios apuntados al servidor
proxy_pointed_cont_domain=0		# Dominios apuntados al proxy
created_cont_domain=0			    # Dominios con estructura generada
created_cont_subdomain=0		  # Dominios con estructura generada

for domain in $( cat "${DOMAINS_FILE}" | grep -v "^#" | cut -d ":" -f1) ; do
echo "wsdg $domain" 
wsdg $domain
#-Debe devolver la estructura para generar el fichero
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
wsldg_ERR="# DANGER : MAIN DOMAN FILE DONT EXIST IN CLUSTER STRUCTURE  "
wsldg_OUT=30
#ENDIF03--[01] - START [IF FINDLINE] ------------------------------------------------------------------
fi
else
wsldg_ERR="# DANGER : MAIN DOMAN FILE IS NOT DEFINED IN CLUSTER STRUCTURE  "
wsldg_OUT=20
#END_IF_[02]-- END [IF DOMAINS_FILE NOT NULL] ---------------------------------------------------------
fi

if [ "${wsldg_OUT}" != "0" -a "${wsldg_ERR}" != "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
wsldg_ERR="# ${wsldg_FUN}::##${wsldg_ERR}"
multi_line_header "${wsldg_ERR}"
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
fi

fi
}
