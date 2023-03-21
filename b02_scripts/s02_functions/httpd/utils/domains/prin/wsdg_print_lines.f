#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.7" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- wsdg_print_lines  
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#N Requiere que se hayan ejecutado wdom y ws_getline
#-- SHOW_WWW_DOMAIN - LOADLANGS - LOADSUBD - HEAD_LINE_INFORMATION
#-- WAF_LINE
#-- CLEAN_DOMAIN - DIVISION - PROJECT - SITE - IP_DOMAIN - HOST_SERVER
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Genera el una linea para fichero de dominios usado en HaProxy
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create haproxy domains structure show
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E wsdg_print_lines 	-- Imprime estructuras en fichero para el dominio preseleccionado
#--------------------------------------------------------------------------------
#+ Funciones frecuentes de llamada : 
#--------------------------------------------------------------------------------
#F wsdg
#--------------------------------------------------------------------------------

wsdg_print_lines()
{
VER="0.0.5"

wsdg_print_lines_FUN="wsdg_print_lines"
wsdg_print_lines_NFO="Imprime estructuras de dominio para ficheros haproxy [$VER]"
wsdg_print_lines_FMT="wsdg_print_lines FILE [FILE_TYPE]"
wsdg_print_lines_EXA="wsdg_print_lines OUT_FILE waf"

wsdg_print_lines_OUT=0
wsdg_print_lines_ERR=""

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wsdg_print_lines_NFO}" "${wsdg_print_lines_FMT}" "${wsdg_print_lines_EXA}"
#--------------------------------------------------------------------------------
else

OUTPUT_FILE_PRINT=${1}
WAF_TYPE=${2}

##echo "${FUNC}:: ${DOMAIN} : ${OUTPUT_FILE_PRINT} - ${WAF_TYPE}"

if [ "${WAF_TYPE}" == "" ] ; then
WAF_TYPE="waf" 
fi

#-Debe siempre cambiar por cada dominio
WAF_LINE="${DOMAIN} ${WAF_TYPE}"

#STA xctrl_org ---------------------------- 2016 jun --- arq - control main ---------------------------
#STA IP:88.198.7.135                        HOSTED:mail.fbrqx.com.

prtyline_set_args_len 35 6 50 13

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
#STA_IF_01 - If wdom_OUT
FILLED_CHAR=" "
OVERFLOW_CHAR=" "
HEAD_LINE_B_01="#STA (${cont_domain}) IP:${IP_DOMAIN} "
HEAD_LINE_B_03=" HOSTED:${HOST_SERVER} "
HEAD_LINE_B_02="$(linea_normal  30 )"
HEAD_LINE_B_04="$(linea_normal 	40  )"

prtyline_set_line "${HEAD_LINE_B_01}" "${HEAD_LINE_B_02}" "${HEAD_LINE_B_03}" "${HEAD_LINE_B_04}" 
HEADER_02="${prtyline_set_line_OUT}"

#STA_IF_01 - If wdom_OUT
else
#Hay error al consultar el dominio. No se ejecuta nunca
echo "${DOMAIN} - IP:${DOMAIN_IP} - HOSTED:${HOST_SERVER} "  >> ${WRONG_DOMAINS_FILE}

fi

#STA brqxcontrol_com ---------------------------- 2016 JUN --- ARQ - CONTROL THIRD ----------------------------
#STA IP:X.Y.X .T  								  HOSTED: mail.fbrqx.com
#brqxcontrol.com waf
#www.brqxcontrol.com waf
#END brqxcontrol_com --==--==--==--==--==--==--== 2016 jun --- arq - control third --==--==--==--==--==--==--==

#-Iterar Idiomas

echo "${HEADER}" | tr "[a-z]" "[A-Z]"				>> ${OUTPUT_FILE_PRINT}

if [ "${HEADER_02}" != "" ] ; then
echo "${HEADER_02}"									>> ${OUTPUT_FILE_PRINT}
echo "${INIPAG}"									>> ${OUTPUT_FILE_PRINT}
fi

if [ "${HEAD_LINE_INFORMATION}" != "" 	] ; then
echo "${HEAD_LINE_INFORMATION}"						>> ${OUTPUT_FILE_PRINT}
fi

echo "${WAF_LINE}"									>> ${OUTPUT_FILE_PRINT}

if [ "${SHOW_WWW_DOMAIN}" == "" 		]  ; then
echo "www.${WAF_LINE}"								>> ${OUTPUT_FILE_PRINT}
fi


#-Iteracion de los subdominios multi idioma
if [ -f "${LANG_FILE}" 			] ; then
if [ "${LOADLANGS}" == "" 		] ; then
echo "${INIPAG}"									>> ${OUTPUT_FILE_PRINT}	

#-For sites unidomain brqx.es - de.brqx.es
for lang in $(cat ${LANG_FILE} | grep -v "^#" ) ; do
LANG_LINE="${lang}.${WAF_LINE}"
echo "${LANG_LINE}"									>> ${OUTPUT_FILE_PRINT}
echo "www.${LANG_LINE}"								>> ${OUTPUT_FILE_PRINT}
done

fi
fi

#### FALTA GESTIONAR BIEN LOS DOMINIOS MULTI IDIOMA PARA QUE NO SEA REPETIDO

#-Iteracion de los subdominios multi idioma
if [ -f "${LANG_FILE}_multi"      ] ; then

if [ "${TYPE_LAN_SITE}"  == "multidomain"             ] ; then

#-For sites with multidomain : arquitecturadrupal - drupalarchitecture
for domain in $(cat "${LANG_FILE}_multi" | grep -v "^#" ) ; do
LANG_LINE="${domain} ${WAF_TYPE}"
echo "Sitio multiple - ${LANG_LINE}"

echo "${LANG_LINE}"                 >> ${OUTPUT_FILE_PRINT}
echo "www.${LANG_LINE}"               >> ${OUTPUT_FILE_PRINT}

done

fi

fi

#-Iteracion de los subdominios multi proyecto
if [ -f "${SUBD_FILE}" 			] ; then
if [ "${LOADSUBD}" == "" 		] ; then
echo "${INIPAG}"									>> ${OUTPUT_FILE_PRINT}

#echd "${wsdg_print_lines_FUN}::${SUBD_FILE}"
for subd_line in $(cat ${SUBD_FILE} | grep -v "^#" ) ; do
#Check for subdomains - Podemos tener mas cosas aparte del nombre en cada fila

#-Esto solo tiene sentido si hay dos puntos
SW_COLON=$(echo ${subd_line} | grep ":" | wc -l)

if [ "${SW_COLON}" != "0" ] ; then
subd=$(			echo ${subd_line} | cut -d ":" -f1	)
php_engine=$(	echo ${subd_line} | cut -d ":" -f2	)
else
subd=${subd_line}
php_engine=
fi

#-Funcion que comprueba el subdominio y depende de que url tengamos podemos improvisar una engine especifica
#-Esta funcion no falla - Trabaja en funcio de los datos pasados


echo "${wsdg_print_lines_FUN}::wsck_engine_subdomain ${subd} ${php_engine}"
wsck_engine_subdomain ${subd} ${php_engine} 

echo "${SUBD_LINE}"									>> ${OUTPUT_FILE_PRINT}
echo "www.${SUBD_LINE}"								>> ${OUTPUT_FILE_PRINT}


if [ "${WAF_TYPE:0:3}" == "loc" 	]	; then
let created_cont_subdomain++
fi	

let cont_subdomain++
done
fi
fi

#-Generar Pie
echo "${INIPAG}"									>> ${OUTPUT_FILE_PRINT}
echo "${FOOTER}"									>> ${OUTPUT_FILE_PRINT}
echo "${NEWPAG}"									>> ${OUTPUT_FILE_PRINT}


fi


}
