#!/bin/bash
#
# Script version 0.0.3
#
#Genera la estructura de proyectos multi idioma
#Para cada proyecto genera el fichero de idiomas
#-Puede ser que quiera un Site con 5 idiomas otro con 10 otro con 25
wsgl()
{
VER="0.0.3"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Genera la estructura de proyectos multi idioma en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : wsgl              					    		"
echo "----------------------------------------------------------"
echo "Example : wsgl			                                "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

OUTOUT="CLEANX"
PROJECT_PATH=${1}


if [ "${PROJECT_PATH}" == "" ] ; then
PROJECT_PATH="/brqi/ /brqs/"
fi

#-Acceso al fichero de proyectos
PROJECT_FILE=$( 	find ${PROJECT_PATH} -type f -name "brqx.fullproy" 	| head -1	) 
LANG_FILE=$( 		find ${PROJECT_PATH} -type f -name "brqx.langs" 	| head -1	) 
LANG_TEMPLATE=$( 	find ${PROJECT_PATH} -type f -name "langs.template" | head -1 	)

if [ -f "${LANG_TEMPLATE}" ] ; then
#-Existe el archivo
AA="one line"
else
LANG_TEMPLATE="/brqi/zzz/langs.template"
fi

LANG_LINE=$( 	cat "${LANG_FILE}"	| grep "LANG" | cut -d ":" -f2 )
FLAN_LINE=$( 	cat "${LANG_FILE}"	| grep "FLAN" | cut -d ":" -f2 )

linea_normal 100
echo "Generacion de ficheros de idioma para los proyectos"
linea_alterna 100

echo "#-Idiomas - Languages" > "${LANG_TEMPLATE}"

for lan_line in ${LANG_LINE} ; do
echo "${lan_line}" >> "${LANG_TEMPLATE}" 
done

for project_line in $( cat ${PROJECT_FILE} | grep -v "^#" ) ; do

#-PROJECT:DIVISION:LANG:REP
#-rct:per:lang
#LANG=ar de es en fr in it pt ru zh
#FLAN
PROJECT=$(    	echo ${project_line} | cut -d ":"  -f1 					)
DIVISION=$(    	echo ${project_line} | cut -d ":"  -f2 					)
LANG=$(    		echo ${project_line} | cut -d ":"  -f3 					)
#----------------------------------------------------------------------
if [ "${LANG}" == "lang" ] ; then
LANG_PROJECT_FILE=""/brqi/${DIVISION}/${PROJECT}/${PROJECT}.languages""
#echo "${LANG_TEMPLATE }"
cp "${LANG_TEMPLATE}" "${LANG_PROJECT_FILE}"
fi

done

linea_normal 100


fi
}
