#!/bin/bash
#
# Script version 0.0.3
#
#Comprueba la estructura definida en el servidor de subdominios
#Util para generar los proyectos
wssck()
{
VER="0.0.3"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Comprueba la estructura de subdominios definida en el servidor en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : wssck  [FILTER] [NO_FULL_LINE] 		    		"
echo "----------------------------------------------------------"
echo "Example : wssck unix		                                "
echo "Example : wssck za no		                                "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

OUTOUT="CLEANX"
FILTER=${1}
NOT_FULL_LINE=${2}
PROJECT_PATH=${3}


if [ "${PROJECT_PATH}" == "" ] ; then
PROJECT_PATH="/brqi/"
fi

echo "#$(linea_normal  130 )"
echo "PROJECT:DOMAIN:SITE:DIVISION"
echo "#$(linea_alterna 130)"

for domain_line in $( find ${PROJECT_PATH} -type f -name "*.spj"  | grep "${FILTER}" ) ; do
#-PROJECT:SUBDOMAIN:DOMAIN:SITE:DIVISION
#-za:cards:cards.abrqx.com:za_main:col:klus|lang|serv|flan
#powerorg_lugares:powerp:lugares:mispresentaciones_org:powerorg:col
#----------------------------------------------------------------------
DIVISION=$(    		echo ${domain_line} | cut -d "/"  -f3 						)
PROJECT=$(    		echo ${domain_line} | cut -d "/"  -f4 						)
SITE_PART=$(    	echo ${domain_line} | cut -d "/"  -f5 						)
SUBDOMAIN=$( 		echo "${SITE_PART}"	| cut -d "_"  -f2 						)
ID_SITE=$( 		echo "${SITE_PART}"	| cut -d "_"  -f1-2 						)
DOMAIN=$(			echo "${SITE_PART}"	| cut -d "_"  -f3-4 | cut -d "." -f1 	)
#----------------------------------------------------------------------
PROJECT_LINE="${PROJECT}:${ID_SITE}:${SUBDOMAIN}:${DOMAIN}:${DIVISION}"
LEN_PROJECT_LINE=$(echo "${PROJECT_LINE}" | wc -c )
LEN_LINE=$( expr 80 - ${LEN_PROJECT_LINE})

if [ "${NOT_FULL_LINE}" == "" ] ; then
PROJECT_LINE="${PROJECT_LINE} -- $(linea_normal ${LEN_LINE})- ${domain_line}"
fi

echo "${PROJECT_LINE}"
done

echo "#$(linea_alterna 130)"


fi
}
