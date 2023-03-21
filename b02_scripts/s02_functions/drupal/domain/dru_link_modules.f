#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- dru_link_modules
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Genera enlaces a themes modules y contemplates en base a parametros definidos
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
#E dru_link_modules -- Genera enlaces a themes modules y contemplates en base a parametros definidos
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
dru_link_modules()
{
VER="0.0.6"

dru_link_modules_FUN="dru_link_modules"
dru_link_modules_NFO="Genera estructura enlaces simbolicos base y pers para sites Drupal [$VER]($DEP) @${QP}"
dru_link_modules_FMT="dru_link_modules LINE [SITE_LANGUAGE] "
dru_link_modules_EXA="dru_link_modules LINE es"

dru_link_modules_OUT=0
dru_link_modules_ERR=""

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${dru_link_modules_NFO}" "${dru_link_modules_FMT}" "${dru_link_modules_EXA}"
#--------------------------------------------------------------------------------

else

#- Requiere que se haya definido DRUPAL_HOME_PATH

FULL_VS_DOMAIN_ALL_MODULES_BASE="${DRUPAL_HOME_PATH}modules/base"
FULL_VS_DOMAIN_ALL_THEMES_BASE="${DRUPAL_HOME_PATH}themes/base"
FULL_VS_DOMAIN_ALL_TEMPLATES_BASE="${DRUPAL_HOME_PATH}contemplates/base"

FULL_VS_DOMAIN_ALL_MODULES_PERS="${DRUPAL_HOME_PATH}modules/pers"
FULL_VS_DOMAIN_ALL_THEMES_PERS="${DRUPAL_HOME_PATH}themes/pers"
FULL_VS_DOMAIN_ALL_TEMPLATES_PERS="${DRUPAL_HOME_PATH}contemplates/pers"

LIBRARIES_TARGET="/brqx/lnk/drupal/v${DRUPAL_VERSION}/libraries"
FULL_LIBRARIES_PATH="${DRUPAL_HOME_PATH}libraries"

# ----- DRUPAL LIBRARIES ZONE -------

#Linking libraries : lnk /brqx/lnk/drupal/v50/libraries /home/ser/zt/main/es/sites/all/libraries
# echo "Linking libraries : lnk ${LIBRARIES_TARGET} ${FULL_LIBRARIES_PATH}"
lnk ${LIBRARIES_TARGET} ${FULL_LIBRARIES_PATH}

# ----- BASE ZONE -------
BASE_BRQI=/brqi/zgn/

#-Iterar modules
BASE_MOD=${BASE_BRQI}mod/base/v${DRUPAL_VERSION}/
BASE_THM=${BASE_BRQI}thm/base/v${DRUPAL_VERSION}/
BASE_TPL=${BASE_BRQI}tpl/base/v${DRUPAL_VERSION}/

if [ "${MODULES_BASE}" != "" ]  ; then

mkc ${FULL_VS_DOMAIN_ALL_MODULES_BASE}

for mod_i in ${MODULES_BASE} ; do

    MODULE_FILE="${BASE_MOD}${mod_i}"    
    if [ -f "${MODULE_FILE}" ] ; then

        SRC_LNK=$(cat ${MODULE_FILE} )
        lnk ${SRC_LNK} ${FULL_VS_DOMAIN_ALL_MODULES_BASE}/${mod_i} 
    fi
done
fi

#-Iterar themes

if [ "${THEMES_BASE}" != "" ]  ; then

mkc ${FULL_VS_DOMAIN_ALL_THEMES_BASE}  

for thm_i in ${THEMES_BASE} ; do

    THEME_FILE="${BASE_THM}${thm_i}"    

    if [ -f "${THEME_FILE}" ] ; then

        SRC_LNK=$(cat ${THEME_FILE} )
    
        lnk  ${SRC_LNK} ${FULL_VS_DOMAIN_ALL_THEMES_BASE}/${thm_i} 
    fi
done
fi

#-Iterar Templates

if [ "${TEMPLATES_BASE}" != "" ]  ; then

mkc ${FULL_VS_DOMAIN_ALL_TEMPLATES_BASE}

for tpl_i in ${TEMPLATES_BASE} ; do

    TEMPLATE_FILE="${BASE_TPL}${tpl_i}"    

    if [ -f "${TEMPLATE_FILE}" ] ; then

        SRC_LNK=$(cat ${TEMPLATE_FILE} )
    
        lnk ${SRC_LNK} ${FULL_VS_DOMAIN_ALL_TEMPLATES_BASE}/${tpl_i} 
    fi

done
fi

#-- PERS ZONE

#-Iterar modules
PERS_PJY="/brqi/${DIVISION}/${PROJECT}/"

if [ "${MODULES_PERS}" != "" ]  ; then

mkc ${FULL_VS_DOMAIN_ALL_MODULES_PERS}

for mod_i in ${MODULES_PERS} ; do

    MODULE_FILE="${PERS_PJY}${mod_i}.mod"    
    if [ -f "${MODULE_FILE}" ] ; then
        
        SRC_LNK=$(cat ${MODULE_FILE} )

        lnk ${SRC_LNK} ${FULL_VS_DOMAIN_ALL_MODULES_PERS}/${mod_i} 

    fi
done
fi

#-Iterar themes

if [ "${THEMES_PERS}" != "" ]  ; then

mkc ${FULL_VS_DOMAIN_ALL_THEMES_PERS}  

for thm_i in ${THEMES_PERS} ; do

    THEME_FILE="${PERS_PJY}${thm_i}.thm"    

    if [ -f "${THEME_FILE}" ] ; then

        SRC_LNK=$(cat ${THEME_FILE} )

        lnk ${SRC_LNK} ${FULL_VS_DOMAIN_ALL_THEMES_PERS}/${thm_i} 

    fi
done
fi

#-Iterar Templates

if [ "${TEMPLATES_PERS}" != "" ]  ; then

mkc ${FULL_VS_DOMAIN_ALL_TEMPLATES_PERS}

for tpl_i in ${TEMPLATES_PERS} ; do

    TEMPLATE_FILE="${PERS_PJY}${tpl_i}.tpl"    

    if [ -f "${TEMPLATE_FILE}" ] ; then

        SRC_LNK=$(cat ${TEMPLATE_FILE} )

        lnk ${SRC_LNK} ${FULL_VS_DOMAIN_ALL_TEMPLATES_PERS}/${tpl_i} 

    fi

done
fi

SITE_LANGUAGE=""
SITE_DOMAIN=""

fi
}
