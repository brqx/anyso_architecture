#!/bin/bash
#
# Script version 0.0.3
#
#Genera la estructura de proyectos subdominio
#Para cada proyecto genera el fichero de idiomas
#-Puede ser que quiera un Site con 5 idiomas otro con 10 otro con 25
#- Esta funcionalidad no tengo claro como implementarla
#- Debo pensarlo mas. Se aplaza
wsgs()
{
VER="0.0.3"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Genera la estructura de proyectos sub dominio en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : wsgs              					    		"
echo "----------------------------------------------------------"
echo "Example : wsgs			                                "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

OUTOUT="CLEANX"
PROJECT_PATH=${1}


if [ "${PROJECT_PATH}" == "" ] ; then
PROJECT_PATH="/brqi/ /brqs/"
fi

#-Acceso al fichero de proyectos

#proj:list of subdomains  (cards - osita - palillos)
PROJECT_FILE_SUBDOMAINS=$( 	find ${PROJECT_PATH} -type f -name "brqx.projects_subdomains" 	| head -1	) 
#proj:list of domains (mispalillos.es mispalillos.com)
PROJECT_FILE_DOMAINS=$( 	find ${PROJECT_PATH} -type f -name "brqx.projects_domains" 		| head -1	) 

PROJECT_FILE_FULL=$( 		find ${PROJECT_PATH} -type f -name "brqx.fullproy" 				| head -1	) 

echo "#Subdomains File Project " 	>	${PROJECT_FILE_SUBDOMAINS}_final
echo "#$(linea_normal 100)"		 	>	${PROJECT_FILE_SUBDOMAINS}_final


linea_normal 100
echo "Generacion de ficheros de subdominio para los proyectos"
linea_alterna 100

#-N01 -  NIVEL 1 : ITERAR TODOS LOS PROYECTOS ------------------------------------------------ 
for project_line in $( cat ${PROJECT_FILE_SUBDOMAINS} | grep -v "^#" ) ; do

#-PROJECT:DIVISION:LANG:REP
PROJECT=$(    	echo ${project_line} 		| cut -d ":"  -f1 						)
SUBDOMAINS=$(   echo ${project_line} 		| cut -d ":"  -f2 						)
DIVISION=$(		cat  ${PROJECT_FILE_FULL} 	| grep ${PROJECT}	| cut -d ":" -f2	)
#----------------------------------------------------------------------
SUBDOMAINS_PROJECT_FILE="/brqi/${DIVISION}/${PROJECT}/${PROJECT}.subdomains"
#-Vamos a averiguar los subdominios definidos del proyecto

#-N02[STA] -  NIVEL 2 : ITERAR TOROS LOS DOMINIOS DEL PROYECTO ------------------------------------ 
#powerp : powercom powerorg etc...

DOMAINS_PROJECT_LINE=$(cat  ${PROJECT_FILE_DOMAINS} | grep ${PROJECT} | grep ":" | cut -d ":" -f2 )

##echo "LINE: ${DOMAINS_PROJECT_LINE} - ${PROJECT_FILE_DOMAINS}"

SUBDOMAIN_LINE=""
CLEAN_SUBDOMAINS_LIST=""

if [ "${DOMAINS_PROJECT_LINE}" != "" ] ; then

for id_domain in ${DOMAINS_PROJECT_LINE} ;  do 
#---------------------------------------------------------------------------------------------

SUBDOMAINS_LIST=$(wssck ${PROJECT} no | grep ${PROJECT} |  grep "${id_domain}" | cut -d ":" -f3 | sort -u | tr "\n" " " )
##powerorg_tecnico:powerp:tecnico:mispresentaciones_org:col
if [ "${SUBDOMAINS_LIST}" != "" ] ; then
##echo "#-Proyectos - Subdominios" > "${SUBDOMAINS_PROJECT_FILE}"
SUBDOMAIN_LINE="${SUBDOMAIN_LINE} ${SUBDOMAINS_LIST}"
fi

#---------------------------------------------------------------------------------------------
done
#-N02[END] -  NIVEL 2 : ITERAR TOROS LOS DOMINIOS DEL PROYECTO ------------------------------------ 

CLEAN_SUBDOMAINS_LIST=$(echo ${SUBDOMAINS_LIST} | tr " " "\n" | sort -u | tr "\n" " ")
echo "SUBDOMAINS:${PROJECT} ${CLEAN_SUBDOMAINS_LIST}"

echo "#${PROJECT} - Subdomains list" 	> "${SUBDOMAINS_PROJECT_FILE}"
if [ "${CLEAN_SUBDOMAINS_LIST}" != "" ]   ; then
for subdomain in ${CLEAN_SUBDOMAINS_LIST}  ; do
echo "${subdomain}" >> "${SUBDOMAINS_PROJECT_FILE}"
##echo ${subdomain}
Aa=1
done

echo "${PROJECT}:${CLEAN_SUBDOMAINS_LIST}"	>> ${PROJECT_FILE_SUBDOMAINS}_new

fi

fi

#echo ${PROJECT_FILE_SUBDOMAINS}_new
done

cat ${PROJECT_FILE_SUBDOMAINS}_new | sort -u >> ${PROJECT_FILE_SUBDOMAINS}_final
rm -f ${PROJECT_FILE_SUBDOMAINS}_new
mv ${PROJECT_FILE_SUBDOMAINS}_final ${PROJECT_FILE_SUBDOMAINS}

linea_normal 100


fi
}
