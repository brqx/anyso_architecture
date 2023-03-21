#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.9" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- wsldi
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- wsdi - wsdg_create_file_structures
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
#E wsldi 	-- Reporta informacion de conectividad de un listado de dominios [domains.map]
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wsldi()
{
VER="0.0.9"								;QV="Brqx Agile Architecture 2016"

wsldi_FUN="wsldi"
wsldi_NFO="Reporta informacion de conectividad de un listado de dominios [$VER]"
wsldi_FMT="wsldi"
wsldi_EXA="wsldi"

wsldi_OUT=0
wsldi_MSG=""
wsldi_ERR=""


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wsldi_NFO}" "${wsldi_FMT}" "${wsldi_EXA}"
#--------------------------------------------------------------------------------
else

#-Generate file structures for process
wsdg_create_file_structures


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

header_dual_common "${wsldi_NFO}" "${wsldi_FMT}"

cont_domain=0					# Listado de dominios totales
cont_subdomain=0				# Listado de dominios totales
pointed_cont_domain=0			# Dominios apuntados al servidor
proxy_pointed_cont_domain=0		# Dominios apuntados al proxy
created_cont_domain=0			# Dominios con estructura generada
created_cont_subdomain=0		# Dominios con estructura generada

for domain in $( cat "${DOMAINS_FILE}" | grep -v "^#" | cut -d ":" -f1 ) ; do
#-Domain Information
wsdi $domain 
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
wsldi_ERR="# DANGER : MAIN DOMAN FILE DONT EXIST IN CLUSTER STRUCTURE  "
wsldi_OUT=30
#ENDIF03--[01] - START [IF FINDLINE] ------------------------------------------------------------------
fi
else
wsldi_ERR="# DANGER : MAIN DOMAN FILE IS NOT DEFINED IN CLUSTER STRUCTURE  "
wsldi_OUT=20
#END_IF_[02]-- END [IF DOMAINS_FILE NOT NULL] ---------------------------------------------------------
fi

if [ "${wsldi_OUT}" != "0" -a "${wsldi_ERR}" != "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
wsldi_ERR="# ${wsldi_FUN}::##${wsldi_ERR}"
multi_line_header "${wsldi_ERR}"
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
fi

fi
}
