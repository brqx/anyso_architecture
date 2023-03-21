#!/bin/bash
#
# Script version 0.0.3
#
#Genera un listado de los dominios de cada proyecto indicando servidor donde esta 
wspg_data_prepare()
{
VER="0.0.3"
wspg_OUT=0
wspg_MSG=""

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Genera la estructura para un WAF Haproxy para el dominio en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : wspg_data_prepare                  				"
echo "----------------------------------------------------------"
echo "Example : wspg_data_prepare 								"
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

OUTOUT="CLEANX"

DOMAIN=${1}
SITES_FILE=${2}

if [ "${PROJECT_PATH}" == "" ] ; then
PROJECT_PATH="/brqi/ /brqs/"
fi

if [ "${SITES_FILE}" == "" ] ; then
SITES_FILE=$(        	find ${PROJECT_PATH} -type f -name "brqx_project_data.sites"		| head -1                )
fi

CLEAN_DOMAIN=$( echo "${DOMAIN}" | tr "." "_"  )
DOMAIN_LINE=$(  find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN}\.pj"  		| head -1    	)
COUNT_DOMAIN_LINE=$(  	find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN}\.pj" | wc -l	        )

if [ ${COUNT_DOMAIN_LINE} != "1" ] ; then
if [ "${BADDEFINITION_DOMAINS_FILE}" != "" ] ; then
echo "#$(linea_normal 103)"												>> ${BADDEFINITION_DOMAINS_FILE}
find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN}\.pj"				>> ${BADDEFINITION_DOMAINS_FILE}
echo "#$(linea_normal 103)"												>> ${BADDEFINITION_DOMAINS_FILE}			
fi
fi



if [ "${DOMAIN_LINE}" != "" ] ; then
#-Domain exist in server
wspg_MSG="Domain exist in server"
wspg_OUT=0

ws_getline ${DOMAIN_LINE}
#-Aqui sabemos el proyecto y demas

#-AQUI OBTENEMOS TODOSLOS DATOS

#-Return ck_OUT - ck_MSG
ck ${DOMAIN} 80

#-Return wdom_OUT - HOST_SERVER - IP_DOMAIN
wdom ${DOMAIN}

#-Return wpin_OUT - wpin_MSG
wpin ${DOMAIN}

#-Return wcur_OUT - PAGE_SIZE - SPEED_DOWNLOAD - HTTP_CODE - SERVER_TYPE - PHP_VERSION - TIME_TOTAL 
wcur ${DOMAIN}

#-Aqui tenemos que tenerlo todo - tambien si responde - si esta montado - ya lo implementare

SEP=':'

#brqx_es      : mainrct        : rct        : per        : mail.ibrqx.com. : 144.76.202.117

#                  1                  2            3                4                 5                   6
NORMAL_LINE_01="${CLEAN_DOMAIN}${SEP}${SITE}${SEP}${PROJECT}${SEP}${DIVISION}${SEP}${HOST_SERVER}${SEP}${IP_DOMAIN}"
#                  7                   8                                 9                      10                
NORMAL_LINE_02="${TIME_TOTAL}${SEP}${PAGE_SIZE_CHANGED}${SEP}${SPEED_DOWNLOAD_CHANGED}${SEP}${SERVER_TYPE}"
#                    11                 12
NORMAL_LINE_03="${PHP_VERSION}${SEP}${wpin_MSG}"

NORMAL_LINE="${NORMAL_LINE_01}${SEP}${NORMAL_LINE_02}${SEP}${NORMAL_LINE_03}"

#echo "${NORMAL_LINE}"

echo "${NORMAL_LINE}" >>	${SITES_FILE}

else
wdom "${DOMAIN}"  2> /dev/null
wspg_MSG="DANGER : MAIN DOMAN FILE DONT EXIST IN CLUSTER STRUCTURE"
wspg_OUT=1
echo "${DOMAIN} - IP:${DOMAIN_IP} - HOSTED:${HOST_SERVER} "  >> ${NOTFOUND_DOMAINS_FILE}

#--[01] - END [IF DOMAIN_LINE] --------------------------------------------------------------------
fi


fi
}
