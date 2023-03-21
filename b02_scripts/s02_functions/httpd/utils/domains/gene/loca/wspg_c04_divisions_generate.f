#!/bin/bash
#
# Script version 0.0.3
#
#Genera un listado de los dominios de cada proyecto indicando servidor donde esta 
wspg_division_pretty_generate()
{
VER="0.0.3"
wspg_OUT=0
wspg_MSG=""

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Genera la estructura pretty para un proyecto en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : wspg_division_pretty_generate [file_waf] [file_loc]                 		"
echo "----------------------------------------------------------"
echo "Example : wspg_division_pretty_generate domains.waf                               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

OUTOUT="CLEANX"

PROJECT=${1}
SITES_FILE=${2}
PRETTY_PROJECT_FILE=${3}


if [ "${PROJECT_PATH}" == "" ] ; then
PROJECT_PATH="/brqi/ /brqs/"
fi

if [ "${SITES_FILE}" == "" ] ; then
SITES_FILE=$(        	find ${PROJECT_PATH} -type f -name "brqx_project_data.sites"		| head -1                )
fi


if [ -f "${SITES_FILE}" ] ; then 
#- STA_IF01 -  If Level 01 


DIVISION=$(	cat "${SITES_FILE}" | grep ":${PROJECT}:" | head -1 | cut -d ":" -f3 )

PRETTY_PROJECT_FILE=/brqi/zzz/sites/${DIVISION}_${PROJECT}.project


YEAR=$( date "+%Y")
MONTH=$(date "+%b")

echo "#$(linea_caracter =- 	100)"								 > ${PRETTY_PROJECT_FILE}
echo "# ${DIVISION} - ${PROJECT} [${YEAR}-${MONTH}]"			>> ${PRETTY_PROJECT_FILE}
echo "#$(linea_normal 		100)"								>> ${PRETTY_PROJECT_FILE}

prtyline_set_args_len 35 25 15 40 

for project_line in $( cat "${SITES_FILE}" | grep -v "^#" | grep ${PROJECT} | sort -u ) ; do
# brqx_es      : mainrct        : rct        : per        : mail.ibrqx.com. : 144.76.202.117


DOMAIN=$( 	echo ${project_line} | cut -d ":" -f1 )
SITE=$( 	echo ${project_line} | cut -d ":" -f2 )
HOSTED=$( 	echo ${project_line} | cut -d ":" -f5 )
IP=$( 		echo ${project_line} | cut -d ":" -f6 )

prtyline_set_line ${DOMAIN} ${SITE} ${IP} ${HOSTED}
echo "$prtyline_set_line_OUT"									>> ${PRETTY_PROJECT_FILE}

# Per 
#---------------------------------------------------------------------
# brqx.es    IP      HOST
# unixy.es   IP      HOST
#---------------------------------------------------------------------

done

echo "#$(linea_caracter =- 100)"								>> ${PRETTY_PROJECT_FILE}


#Ficheros : ${SERVER}.sites

# Fbrqx.com 
#---------------------------------------------------------------------
# brqx.es    rct 	IP      HOST
# unixy.es   rct    IP      HOST
#---------------------------------------------------------------------

#brqx_es              : rct        : per        : mail.ibrqx.com. : 144.76.202.117

#-No necesito pretty lines ahora
#prtyline_set_args_len 20 10 10 15 15
#prtyline_sep_line ${CLEAN_DOMAIN} ${PROJECT} ${DIVISION} ${HOST_SERVER} ${IP_DOMAIN}


else
wdom "${DOMAIN}"  2> /dev/null
wspg_MSG="DANGER : MAIN DOMAN FILE DONT EXIST IN CLUSTER STRUCTURE"
wspg_OUT=1
echo "${DOMAIN} - IP:${DOMAIN_IP} - HOSTED:${HOST_SERVER} "  >> ${NOTFOUND_DOMAINS_FILE}

#--[01] - END [IF DOMAIN_LINE] --------------------------------------------------------------------
fi


fi
}
