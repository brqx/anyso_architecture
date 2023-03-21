#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#-------------------------------------------------------------------
#-- wsodg
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- wsdg
#-- ws_getline
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera el fichero de dominios para usarse en HaProxy
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T create haproxy domains structure
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [PJ_PATH]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E wsfdg 	-- Genera la estructura de dominios para usarse en HaProxy [domains.ful]
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#-ONE DOMAIN GENERATE
wsodg()
{
VER="0.0.3"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Genera un listado de dominios para servidores haproxy en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : wsodg [FILE | DOMAIN]							"
echo "----------------------------------------------------------"
echo "Example : wsodg 											"
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

echo "Entrando : ${1} "
#-File of all domains
FULL_DOMAINS_FILE=/etc/haproxy/domains.ful_one
echo "#-FULL DOMAINS HAPROXY STRUCTURE - BRQX 2016" 			> 	${FULL_DOMAINS_FILE}
echo "#$(linea_caracter '=' 103 )"								>> 	${FULL_DOMAINS_FILE}

#-File of all domains of current server
SERVER_DOMAINS_FILE=/etc/haproxy/domains.map_one
echo "#-CURRENT SERVER DOMAIN HAPROXY STRUCTURE - BRQX 2016" 	> 	${SERVER_DOMAINS_FILE}
echo "#$(linea_caracter '=' 103 )"								>> 	${SERVER_DOMAINS_FILE}

#-Domains don't defined in structure yet
NOTFOUND_DOMAINS_FILE=/etc/haproxy/znotfounddomains.wrg

#-Wront - to check print_lines
WRONG_DOMAINS_FILE=/etc/haproxy/zwrongdomains.wrg
echo "#-DOMAIN WRONGS UNHOSTED STRUCTURE - BRQX 2016" 			> 	${WRONG_DOMAINS_FILE}
echo "#$(linea_caracter '=' 103 )"								>> 	${WRONG_DOMAINS_FILE}


echo "#-DOMAIN UNRESOLVED UNHOSTED STRUCTURE - BRQX 2016" 		> 	${NOTFOUND_DOMAINS_FILE}
echo "#$(linea_caracter '=' 103 )"								>> 	${NOTFOUND_DOMAINS_FILE}

#-Domains not correclty defined in structure (multiple)
BADDEFINITION_DOMAINS_FILE=/etc/haproxy/znotcorrectdomains.wrg
echo "#ALERT - MULTIPLE DOMAIN DEFINITION - BRQX 2016"			> 	${BADDEFINITION_DOMAINS_FILE}
echo "#$(linea_caracter '=' 103 )"								>> 	${BADDEFINITION_DOMAINS_FILE}


OUTOUT="CLEANX"

#-Vamos a permitir que se pueda pasar o un dominio o un fichero
DOMAIN_PASED_FILE_OR_DOMAIN=${1}

if [ "${DOMAIN_PASED_FILE_OR_DOMAIN}" == "" ]  ; then
DOMAIN_PASED_FILE_OR_DOMAIN="/brqi/zzz/brqx.testdom"
fi

echo "Fichero o dominio : ${DOMAIN_PASED_FILE_OR_DOMAIN}"

if [ "${PROJECT_PATH}" == "" ] ; then
PROJECT_PATH="/brqi/"
fi

#Hay que obtener el servidor

DOMAINS_FILE=$(        	find ${PROJECT_PATH} -type f -name "brqx.fulldom"     			| head -1                )

echo "#$(linea_normal 	100)"		
echo "#Generando estructura multi dominios HaProxy"
echo "#$(linea_alterna 	100)"

cont_domain=0
real_cont_domain=0

if [ -f "${DOMAIN_PASED_FILE_OR_DOMAIN}" ] ; then
#- Se ha pasado un fichero para hacer las pruebas
echo "Es un fichero"
for domain in $( cat "${DOMAIN_PASED_FILE_OR_DOMAIN}" | grep -v "^#") ; do
#Lamada al generador de dominios
#wsdg brqx.es  
echo "wsdg $domain $cont_domain"
wsdg $domain 
#-Debe devolver la estructura para generar el fichero
let cont_domain++
done
else
#- Se ha pasado un solo dominio
echo "Es un dominio"

wsdg ${DOMAIN_PASED_FILE_OR_DOMAIN} 
let cont_domain++

fi

echo "#$(linea_normal 	100)"		
echo "# [${real_cont_domain}] dominios generados de [${cont_domain}]  para la estructura HaProxy"
echo "#$(linea_alterna 	100)"


DOMAIN_PASED_FILE_OR_DOMAIN=""
fi
}
