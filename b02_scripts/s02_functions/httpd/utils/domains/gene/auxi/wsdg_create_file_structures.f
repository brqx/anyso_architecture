#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.8" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- wsdg_create_file_structures
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas /Ficheros
#--------------------------------------------------------------------------------
#-- NOTFOUND - WRONG - BADDEFINITION - UNSTRUCTURED 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Genera el fichero de dominios para usarse en HaProxy
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create haproxy domains structure
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E wsdg_create_file_structures 	-- Genera estructuras de ficheros a usar en el proceso
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wsdg_create_file_structures()
{
VER="0.0.8"
FUNC="wsdg_create_file_structures"

wsdg_create_file_structures_NFO="Genera estructuras de ficheros a usar en el proceso [$VER]"
wsdg_create_file_structures_FMT="wsdg_create_file_structures"
wsdg_create_file_structures_EXA="wsdg_create_file_structures"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wsdg_create_file_structures_NFO}" "${wsdg_create_file_structures_FMT}" "${wsdg_create_file_structures_EXA}"
#--------------------------------------------------------------------------------
else

#-File of all domains
FULL_DOMAINS_FILE=/brqs/domains/domains.ful
echo "#-FULL DOMAINS HAPROXY STRUCTURE - BRQX 2016" 			> 	${FULL_DOMAINS_FILE}
echo "#$(linea_caracter '=' 102 )"								>> 	${FULL_DOMAINS_FILE}

#-File of all domains of current server
SERVER_DOMAINS_FILE=/etc/haproxy/domains.map
echo "#-CURRENT SERVER DOMAIN HAPROXY STRUCTURE - BRQX 2016" 	> 	${SERVER_DOMAINS_FILE}
echo "#$(linea_caracter '=' 102 )"								>> 	${SERVER_DOMAINS_FILE}

#-Domains don't defined in structure yet
NOTFOUND_DOMAINS_FILE=/etc/haproxy/znotfounddomains.wrg

#-Wront - to check print_lines
WRONG_DOMAINS_FILE=/etc/haproxy/zwrongdomains.wrg
echo "#-DOMAIN WRONGS UNHOSTED STRUCTURE - BRQX 2016" 			> 	${WRONG_DOMAINS_FILE}
echo "#$(linea_caracter '=' 102 )"								>> 	${WRONG_DOMAINS_FILE}


echo "#-DOMAIN UNRESOLVED UNHOSTED STRUCTURE - BRQX 2016" 		> 	${NOTFOUND_DOMAINS_FILE}
echo "#$(linea_caracter '=' 102 )"								>> 	${NOTFOUND_DOMAINS_FILE}

#-Domains not correclty defined in structure (multiple)
BADDEFINITION_DOMAINS_FILE=/etc/haproxy/znotcorrectdomains.wrg
echo "#ALERT - MULTIPLE DOMAIN DEFINITION - BRQX 2016"			> 	${BADDEFINITION_DOMAINS_FILE}
echo "#$(linea_caracter '=' 102 )"								>> 	${BADDEFINITION_DOMAINS_FILE}

#-Domains without structure pointed to current server | proxy
UNSTRUCTURED_DOMAINS_FILE=/etc/haproxy/znotexiststructure.wrg
echo "#ALERT - UNSTRUCTURED DOMAIN DEFINITION - BRQX 2016"		> 	${UNSTRUCTURED_DOMAINS_FILE}
echo "#$(linea_caracter '=' 102 )"								>> 	${UNSTRUCTURED_DOMAINS_FILE}

#END_IF_[01] - END Fin Funcion ------------------------------------------------------------------------
fi
}
