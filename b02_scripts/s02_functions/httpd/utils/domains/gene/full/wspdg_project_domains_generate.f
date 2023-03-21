#!/bin/bash
#
# Script version 0.0.3
#
#Genera un listado de dominios para servidores haproxy
#Project Domains Generate - Debe generar un listado de los dominios de cada proyecto
#-PROJECT DOMAIN GENERATE
wspdg()
{
VER="0.0.3"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Genera un listado de dominios para servidores haproxy en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : wspdg [file_waf] [file_loc]                 		"
echo "----------------------------------------------------------"
echo "Example : wspdg domains.waf                               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
#-Algoritmo : 
#
#-1.Generar fichero de datos 

# Ficheros : project_data_brqx.sites
# +----------------------------------------------------------------------------------
# Domain				Project		Division	  Server			 IP
# +----------------------------------------------------------------------------------
# brqx_es              : rct        : per        : mail.ibrqx.com. : 144.76.202.117

#-2.Generar fichero de proyectos

# Ficheros : ${DIVISION}_${PROJECT}.sites
# +----------------------------------------------------------------------------------
# Per - Rct
# -----------------------------------------------------------------------------------
# brqx.es    IP      HOST
# unixy.es   IP      HOST
# -----------------------------------------------------------------------------------

#-3.Generar Fichero de servidores
#Ficheros : ${SERVER}.sites
# +----------------------------------------------------------------------------------
# Fbrqx.com 
# -----------------------------------------------------------------------------------
# brqx.es    rct 	IP      HOST
# unixy.es   rct    IP      HOST
# -----------------------------------------------------------------------------------



#-File of all domains

#-Domains don't defined in structure yet
NOTFOUND_DOMAINS_FILE=/etc/haproxy/znotfounddomains.wrg

echo "#-DOMAIN UNRESOLVED UNHOSTED STRUCTURE - BRQX 2016" 		> 	${NOTFOUND_DOMAINS_FILE}
echo "#$(linea_caracter '=' 103 )"								>> 	${NOTFOUND_DOMAINS_FILE}

#-Domains not correclty defined in structure (multiple)
BADDEFINITION_DOMAINS_FILE=/etc/haproxy/znotcorrectdomains.wrg
echo "#ALERT - MULTIPLE DOMAIN DEFINITION - BRQX 2016"			> 	${BADDEFINITION_DOMAINS_FILE}
echo "#$(linea_caracter '=' 103 )"								>> 	${BADDEFINITION_DOMAINS_FILE}


OUTOUT="CLEANX"
IDSITE=${1}

PROJECT_PATH="/brqi/"

#Hay que obtener el servidor

DOMAINS_FILE=$(        	find ${PROJECT_PATH} -type f -name "brqx.fulldom"     				| head -1                )
SITES_FILE=$(        	find ${PROJECT_PATH} -type f -name "brqx_project_data.sites"		| head -1                )
PRETTY_SITES_FILE=$(    find ${PROJECT_PATH} -type f -name "brqx_project_data.pretty_sites"	| head -1                )

if [ "${SITES_FILE}" == "" 		] ; then
SITES_FILE="/brqi/zzz/brqx_project_data.sites"
PRETTY_SITES_FILE="/brqi/zzz/brqx_project_data.pretty_sites"

fi

##if [ -f "${SITES_FILE}" 		] ; then
##echo ""  > ${SITES_FILE}
##fi


if [ "${DOMAINS_FILE}" != "" 	] ; then
if [ -f "${DOMAINS_FILE}"    	] ; then
#--[01] - START [IF FINDLINE] ------------------------------------------------------------------
#Tenemos que iterar todos los dominios
#-1.Averiguar datos de los mismos
#-2.Averiguar los idiomas de los mismos
#-3.Indigar los subdominios definidos
#-4.Generar la estructura


echo "#$(linea_normal 	100)								"		
echo "#Generando estructura multi sites and pretty files 	"
echo "#Brqx Architecture 2016								"	
echo "#$(linea_alterna 	100)								"

#-Vaciamos el fichero de sites

if [ -f "${SITES_FILE}" ] ; then

#-1. Generar Fichero de datos [OK] - Desactivado - tarda unos 20min
 
##for domain in $( cat "${DOMAINS_FILE}" | grep -v "^#" | cut -d ":" -f1) ; do
# Ws Project Data Prepare
# brqx_es     : mainrct         : rct        : per        : mail.ibrqx.com. : 144.76.202.117

##wspg_data_prepare $domain  "${SITES_FILE}"
#-Debe devolver la estructura para generar el fichero
##done

#-Tenemos el primer fichero pretty [OK]
##wspg_data_generate ${SITES_FILE} ${PRETTY_SITES_FILE} 


# brqx_es              : rct        : per        : mail.ibrqx.com. : 144.76.202.117
SERVERS_LINE=$(		cat "${SITES_FILE}" | cut -d ":" -f5 | sort -u | tr "\n" " " )
DIVISIONS_LINE=$(	cat "${SITES_FILE}" | cut -d ":" -f4 | sort -u | tr "\n" " " )
PROJECT_LINE=$(		cat "${SITES_FILE}" | cut -d ":" -f3 | sort -u | tr "\n" " " )
SITES_LINE=$(		cat "${SITES_FILE}" | cut -d ":" -f2 | sort -u | tr "\n" " " )


for project in ${PROJECT_LINE}  ; do
#Ficheros : ${DIVISION}_${PROJECT}.project
# Per - Rct
#---------------------------------------------------------------------
# brqx.es    IP      HOST
# unixy.es   IP      HOST
#---------------------------------------------------------------------

wspg_project_pretty_generate ${project} ${SITES_FILE} 
done

for project in ${DIVISIONES_LINE}  ; do
#Ficheros : ${DIVISION}.div

#---------------------------------------------------------------------

echo "wspg_division_pretty_generate ${project} ${SITES_FILE}" 
done

for server in ${SERVERS_LINE}  ; do
#Ficheros : ${DIVISION}.dif

#---------------------------------------------------------------------
echo "wspg_server_pretty_generate ${project} ${SITES_FILE}" 
done



else
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--"
echo "DANGER : MAIN DOMAN FILE DONT EXIST IN CLUSTER STRUCTURE  "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--"

#--[01] - END [IF FINDLINE] --------------------------------------------------------------------
fi

else
echo "#$(linea_caracter ==-- 100)"
echo "#DANGER : MAIN DOMAN FILE IS NOT DEFINED IN CLUSTER STRUCTURE  "
echo "#$(linea_caracter ==-- 100)"

#--[01] - END [IF FINDLINE] --------------------------------------------------------------------
fi

else
echo "#$(linea_caracter ==-- 100)"
echo "#DANGER : SITES FILE DON'T EXIST AND CAN'T BE CREATED"
echo "#$(linea_caracter ==-- 100)"

#--[01] - END [IF FINDLINE] --------------------------------------------------------------------
fi



fi
}
