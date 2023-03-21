#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.7" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#-------------------------------------------------------------------
#-- wsdg_show_lines  
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#N Requiere que se hayan ejecutado wdom y ws_getline
#-------------------------------------------------------------------
#-- CLEAN_DOMAIN - DIVISION - PROJECT - SITE - IP_DOMAIN - HOST_SERVER
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera el una linea para fichero de dominios usado en HaProxy
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T create haproxy domains structure show
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [PJ_PATH]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E wsdg_show_lines 	-- Imprime estructuras para el dominio preseleccionado
#-------------------------------------------------------------------
#+ Funciones frecuentes de llamada : 
#-------------------------------------------------------------------
#F wsdgout
#-------------------------------------------------------------------

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#Invocada desd wsdgout
wsdg_show_lines()
{
VER="0.0.3"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Imprime estructuras para el dominio preseleccionado		"
echo "=========================================================="
echo "Format  : wsdg_show_lines [WAF_TYPE]						"
echo "----------------------------------------------------------"
echo "Example : wsndg domains.waf                               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

OUTOUT="CLEANX"

WAF_TYPE=${1}

if [ "${WAF_TYPE}" == "" ] ; then
WAF_TYPE="waf" 
fi

if [ "${WAF_LINE}" == "" ] ; then 
WAF_LINE="${DOMAIN} ${WAF_TYPE}"
fi

#STA xctrl_org ---------------------------- 2016 jun --- arq - control main ---------------------------
#STA IP:88.198.7.135                        HOSTED:mail.fbrqx.com.

prtyline_set_args_len 25 11 37 30

YEAR=$( date "+%Y")
MONTH=$(date "+%b")

HEAD_LINE_A_01="#STA ${CLEAN_DOMAIN} "
HEAD_LINE_A_02="$(linea_normal  30 )"
HEAD_LINE_A_03=" ${YEAR} ${MONTH} --- ${DIVISION} - ${PROJECT} ${SITE} "
HEAD_LINE_A_04="$(linea_normal 	40  )"

FOOT_LINE_A_01="#END ${CLEAN_DOMAIN} "
FOOT_LINE_A_02="$(linea_alterna 30 )"
FOOT_LINE_A_03=" ${YEAR} ${MONTH} --- ${DIVISION} - ${PROJECT} ${SITE} "
FOOT_LINE_A_04="$(linea_alterna	40  )"

#-Generar Cabecera 01

FILLED_CHAR="-"
OVERFLOW_CHAR="-"
prtyline_set_line "${HEAD_LINE_A_01}" "${HEAD_LINE_A_02}" "${HEAD_LINE_A_03}" "${HEAD_LINE_A_04}" 
HEADER="${prtyline_set_line_OUT}"

prtyline_set_line "${FOOT_LINE_A_01}" "${FOOT_LINE_A_02}" "${FOOT_LINE_A_03}" "${FOOT_LINE_A_04}" 
FOOTER="${prtyline_set_line_OUT}"

LANG_FILE="/brqi/${DIVISION}/${PROJECT}/${PROJECT}.languages"
SUBD_FILE="/brqi/${DIVISION}/${PROJECT}/${PROJECT}.subdomains"

NEWPAG="#$(linea_multi_caracter 34 --= )"
INIPAG="#$(linea_normal  102 )"

#-Generar Cabecera02
if [ "${wdom_OUT}" == "0" ] ; then
FILLED_CHAR=" "
OVERFLOW_CHAR=" "
HEAD_LINE_B_01="#STA IP:${IP_DOMAIN} "
HEAD_LINE_B_03=" HOSTED:${HOST_SERVER} "
HEAD_LINE_B_02="$(linea_normal  30 )"
HEAD_LINE_B_04="$(linea_normal 	40  )"

prtyline_set_line "${HEAD_LINE_B_01}" "${HEAD_LINE_B_02}" "${HEAD_LINE_B_03}" "${HEAD_LINE_B_04}" 
HEADER_02="${prtyline_set_line_OUT}"
fi

#STA brqxcontrol_com ---------------------------- 2016 JUN --- ARQ - CONTROL THIRD ----------------------------
#STA IP:X.Y.X .T  								  HOSTED: mail.fbrqx.com
#brqxcontrol.com waf
#www.brqxcontrol.com waf
#END brqxcontrol_com --==--==--==--==--==--==--== 2016 jun --- arq - control third --==--==--==--==--==--==--==

#-Iterar Idiomas

echo ${HEADER} | tr "[a-z]" "[A-Z]"				

if [ "${HEADER_02}" != "" ] ; then
echo "${HEADER_02}"								
echo "${INIPAG}"								
fi

if [ "${HEAD_LINE_INFORMATION}" != "" 	] ; then
echo "${HEAD_LINE_INFORMATION}"
fi

echo "${WAF_LINE}"								

if [ "${SHOW_WWW_DOMAIN}" == "" 		]  ; then
echo "www.${WAF_LINE}"							
fi

#-Iteracion de los subdominios multi idioma
if [ -f "${LANG_FILE}" 			] ; then 
if [ "${LOADLANGS}" == "" 		] ; then
echo "${INIPAG}"									
for lang in $(cat ${LANG_FILE} | grep -v "^#" ) ; do
LANG_LINE="${lang}.${WAF_LINE}"
echo "${LANG_LINE}"								
echo "www.${LANG_LINE}"							
done
fi
fi

#-Iteracion de los subdominios multi proyecto
if [ -f "${SUBD_FILE}"			] ; then 
if [ "${LOADSUBD}" == "" 		] ; then
echo "${INIPAG}"								
for subd in $(cat ${SUBD_FILE} | grep -v "^#" ) ; do
SUBD_LINE="${subd}.${WAF_LINE}"
echo "${SUBD_LINE}"								
echo "www.${SUBD_LINE}"							
done
fi
fi

#-Generar Pie
echo "${INIPAG}"								
echo "${FOOTER}"								
echo "${NEWPAG}"								

#-Vaciado variables
wsempty
fi
}
