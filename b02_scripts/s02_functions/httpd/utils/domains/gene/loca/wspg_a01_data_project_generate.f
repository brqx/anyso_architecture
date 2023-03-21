#!/bin/bash
#
# Script version 0.0.3
#
#Genera un listado de los dominios de cada proyecto indicando servidor donde esta 
wspg_data_generate()
{
VER="0.0.3"
wspg_OUT=0
wspg_MSG=""
FUN="wspg_data_generate"

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Genera la estructura de projectos en formato pretty en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : wspg_data_generate [PROJECT_FILE]                  		"
echo "----------------------------------------------------------"
echo "Example : wspg_data_generate domains.waf                               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

OUTOUT="CLEANX"

SITES_FILE=${1}
PRETTY_SITES_FILE=${2}

if [ "${PROJECT_PATH}" == "" ] ; then
PROJECT_PATH="/brqi/ /brqs/"
fi

if [ "${SITES_FILE}" == "" ] ; then
SITES_FILE=$(        	find ${PROJECT_PATH} -type f -name "brqx_project_data.sites"		| head -1                )
PRETTY_SITES_FILE=$(    find ${PROJECT_PATH} -type f -name "brqx_project_data.pretty_sites"	| head -1                )
fi

if [ -f "${SITES_FILE}" 			] ; then 
#- STA_IF01 -  If Level 01 
if [ -f "${PRETTY_SITES_FILE}" 		] ; then
#- STA_IF02 -  If Level 02 

SEP=' : '

#-Averiguar size de los campos
# brqx_es     : mainrct         : rct        : per        : mail.ibrqx.com. : 144.76.202.117

ARGS_LEN[1]=0
ARGS_LEN[2]=0
ARGS_LEN[3]=0
ARGS_LEN[4]=0
ARGS_LEN[5]=0
ARGS_LEN[6]=0
ARGS_LEN[7]=0
ARGS_LEN[8]=0
ARGS_LEN[9]=0
ARGS_LEN[10]=0
ARGS_LEN[11]=0
ARGS_LEN[12]=0


for site_line in $( cat "${SITES_FILE}" | grep -v "^#" ) ; do

##echo "${site_line}"
for j in 1 2 3 4 5 6 7 8 9 10 11 12  ; do
FIELD[${j}]=$(echo "${site_line}"| cut -d ":" -f ${j} )
CURRENT_FIELD=${FIELD[$j]}
LEN[$j]=${#CURRENT_FIELD}

#-Comparamos para quedarnos con el mas largo
if [ ${ARGS_LEN[$j]} -lt ${LEN[$j]} ] ; then
ARGS_LEN[$j]=${LEN[$j]}
fi

done

done
#-En este punto podemos generar los ficheros base de divisiones - servidores -projectos

prtyline_set_args_len  ${ARGS_LEN[1]} ${ARGS_LEN[2]} ${ARGS_LEN[3]} ${ARGS_LEN[4]} ${ARGS_LEN[5]} ${ARGS_LEN[6]} ${ARGS_LEN[7]} ${ARGS_LEN[8]} ${ARGS_LEN[9]} ${ARGS_LEN[10]} ${ARGS_LEN[11]} ${ARGS_LEN[12]}

echo "#$(linea_normal 100)" 				> 		${PRETTY_SITES_FILE}


for site_line in $( cat "${SITES_FILE}" | grep -v "^#" ) ; do

for j in 1 2 3 4 5 6 7 8 9 10 11 12 ; do
FIELD[${j}]=$(echo "${site_line}"| cut -d ":" -f ${j} )
done
# Domain Project Div Hosted IP
prtyline_sep_line ${FIELD[1]} ${FIELD[2]} ${FIELD[3]} ${FIELD[4]} ${FIELD[5]} ${FIELD[6]} ${FIELD[7]} ${FIELD[8]} ${FIELD[9]} ${FIELD[10]} ${FIELD[11]} ${FIELD[12]}    
echo "${prtyline_sep_line_OUT}" 					>> 	${PRETTY_SITES_FILE}

done

#Ficheros : ${DIVISION}_${PROJECT}.sites
# Per - Rct
#---------------------------------------------------------------------
# brqx.es    IP      HOST
# unixy.es   IP      HOST
#---------------------------------------------------------------------

#Ficheros : ${SERVER}.sites

# Fbrqx.com 
#---------------------------------------------------------------------
# brqx.es    rct 	IP      HOST
# unixy.es   rct    IP      HOST
#---------------------------------------------------------------------

else
echo "#$(linea_caracter ==-- 100)"
echo "#DANGER ($FUN) : SITES FILE DON'T EXIST AND CAN'T BE CREATED"
echo "#$(linea_caracter ==-- 100)"

#- END_IF02 -  Fin If Level 02 
fi
else
echo "#$(linea_caracter ==-- 100)"
echo "#DANGER ($FUN) : SITES FILE DON'T EXIST AND CAN'T BE CREATED"
echo "#$(linea_caracter ==-- 100)"

#- END_IF01 -  Fin If Level 01 
fi
fi
}
