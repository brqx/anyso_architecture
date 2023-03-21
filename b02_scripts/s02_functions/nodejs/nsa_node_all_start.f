#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- nodejs_start_all_sites
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Inicia un Site con NodeJS
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create theme modules contemplates links
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P 
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E nodejs_start_all_sites -- Genera enlaces a themes modules y contemplates en base a parametros definidos
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
nodejs_start_all_sites()
{
VER="0.0.6"

nodejs_start_all_sites_FUN="nodejs_start_all_sites"
nodejs_start_all_sites_NFO="Inicia todos los sites Node Js del servidor [$VER]($DEP) @${QP}"
nodejs_start_all_sites_FMT="nodejs_start_all_sites"
nodejs_start_all_sites_EXA="nodejs_start_all_sites"

nodejs_start_all_sites_OUT=0
nodejs_start_all_sites_ERR=""


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${nodejs_start_all_sites_NFO}" "${nodejs_start_all_sites_FMT}" "${nodejs_start_all_sites_EXA}"
#--------------------------------------------------------------------------------

else

#- Requiere que se ejecute con el usuario composer

MYUID=$(whoami)

if [ "${MYUID}" == "composer" ] ; then

NODE_PROJECT_PATH="/brqi/zzz/server/brqx.current"

# cat "${NODE_PROJECT_PATH}" | grep "nodejs"

MAIN_OLD_PATH=${PWD}


for line in $( cat "${NODE_PROJECT_PATH}" | grep -v "^#"  | grep "nodejs" ) ; do

MDIV=$(echo "${line}" | cut -d ":" -f1)
MPRO=$(echo "${line}" | cut -d ":" -f2)
MSIT=$(echo "${line}" | cut -d ":" -f3)

echo "${line} - ${MDIV} - ${MPRO} - ${MSIT}" 

if [ "${MDIV}" != "" -a  "${MPRO}" != "" -a  "${MSIT}" != "" ] ; then

# Alias ns
nodejs_start_site ${MDIV} ${MPRO} ${MSIT}

echo "--==--==--==--==--==--==--==--==--==--==--==--==--==--==--="

fi

done  

cd ${MAIN_OLD_PATH}
# FIND_LINE=$(   find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN}.pj"  | head -1  )

else
nodejs_start_all_sites_ERR="Debe ejecutarse con composer"  

echo "${nodejs_start_all_sites_NFO}" "${nodejs_start_all_sites_ERR}"

#footer_error "${nodejs_start_all_sites_NFO}" "${nodejs_start_all_sites_ERR}"
# End if Composer
fi

fi
}
