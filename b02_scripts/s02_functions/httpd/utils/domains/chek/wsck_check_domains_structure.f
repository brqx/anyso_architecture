#!/bin/bash
#
# Script version 0.0.3
#
#Comprueba la estructura definida en el servidor
#Util para generar los proyectos
wsck()
{
VER="0.0.3"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Comprueba la estructura definida en el servidor en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : wsck  [FILTER] [NO_FULL_LINE] 		    		"
echo "----------------------------------------------------------"
echo "Example : wsck unix		                                "
echo "Example : wsck rct no		                                "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

OUTOUT="CLEANX"
FILTER=${1}
NOT_FULL_LINE=${2}
PROJECT_PATH=${3}


if [ "${PROJECT_PATH}" == "" ] ; then
PROJECT_PATH="/brqi/"
fi

echo "#$(linea_normal 100 )"
echo "PROJECT:DOMAIN:SITE:DIVISION"
echo "#$(linea_alterna 100)"

for domain_line in $( find ${PROJECT_PATH} -type f -name "*.pj"  | grep "${FILTER}" ) ; do
#-PROJECT:DOMAIN:SITE:DIVISION
#-war:thisisthewar.com:main:pyc:klus|lang|serv|flan
#FLAN
DIVISION=$(    	echo ${domain_line} | cut -d "/"  -f3 					)
PROJECT=$(    	echo ${domain_line} | cut -d "/"  -f4 					)
SITE_PART=$(    echo ${domain_line} | cut -d "/"  -f5 					)
ID_SITE=$(    	echo ${SITE_PART} 	| cut -d "_"  -f1 					)
DOMAIN=$(		    echo ${SITE_PART} 	| cut -d "_"  -f2- | cut -d "." -f1 )
#----------------------------------------------------------------------
PROJECT_LINE="${PROJECT}:${DOMAIN}:${ID_SITE}:${DIVISION}"
LEN_PROJECT_LINE=$(echo "${PROJECT_LINE}" | wc -c )
LEN_LINE=$( expr 50 - ${LEN_PROJECT_LINE})

if [ "${NOT_FULL_LINE}" == "" ] ; then
PROJECT_LINE="${PROJECT_LINE} -- $(linea_normal ${LEN_LINE})- ${domain_line}"
fi

echo "${PROJECT_LINE}"
done

echo "#$(linea_alterna 100)"


fi
}
