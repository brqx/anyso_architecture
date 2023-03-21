#!/bin/bash
#
# Script version 0.0.3
#
#Genera la estructura para un WAF Haproxy para el dominio 
wsdgout()
{
VER="0.0.3"

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Reporta la estructura para un WAF Haproxy para el dominio en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : wsdg [file_waf] [file_loc]                 		"
echo "----------------------------------------------------------"
echo "Example : wsndg domains.waf                               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

OUTOUT="CLEANX"

DOMAIN_PASED=${1}
DOMAINS_FILE=${2}

if [ "${PROJECT_PATH}" == "" ] ; then
PROJECT_PATH="/brqi/"
fi

if [ "${DOMAINS_FILE}" == "" ] ; then
DOMAINS_FILE=$( find ${PROJECT_PATH} -type f -name "brqx.fulldom"     | head -1                )
fi

CLEAN_DOMAIN_PASED=$( echo "${DOMAIN_PASED}" | tr "." "_"  )

DOMAIN_LINE=$(  		find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN_PASED}\.pj"  | head -1             )
COUNT_DOMAIN_LINE=$(  	find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN_PASED}\.pj"  | wc -l	             )

if [ ${COUNT_DOMAIN_LINE} != "1" ] ; then
echo "#ALERT - MULTIPLE DOMAIN DEFINITION"
echo "#$(linea_normal 103)"
find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN_PASED}\.pj"
find_OUT=$?
if [ "${find_OUT}" == "0" ] ; then
echo "#$(linea_normal 103)"
fi

fi


#Duda si debe existir o no la linea de dominio
if [ "${DOMAIN_LINE}" != "" ] ; then
ws_getline ${DOMAIN_LINE}

#-Aqui sabemos el proyecto y demas

wdom ${DOMAIN_PASED}

#Asume waf como defecto [WAF_TYPE]
wsdg_show_lines  waf

wsempty

else
echo "#$(linea_caracter '==--' 102)"
echo "#DANGER : MAIN DOMAN FILE DONT EXIST IN CLUSTER STRUCTURE  "
echo "#$(linea_caracter '==--' 102)"

#--[01] - END [IF DOMAIN_LINE] --------------------------------------------------------------------
fi


fi
}
