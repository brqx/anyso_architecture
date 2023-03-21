#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - AGILE ARQ - Rct - 2019
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- d-ws_create_node_structure-
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Genera estructura Node JS
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create node nodejs structure
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P 
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ws_create_node_structure
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_create_node_structure()
{
VER="0.1.5"
DEP="00"		# Depth script

ws_create_node_structure_content_FUN="ws_create_node_structure_content"
ws_create_node_structure_content_NFO="Genera estructura enlaces pra proyectos de Nod JS  [$VER]($DEP) @${QP}"
ws_create_node_structure_content_FMT="ws_create_node_structure"
ws_create_node_structure_content_EXA="ws_create_node_structure"

F=${ws_create_node_structure_content_FUN}

ws_create_node_structure_content_OUT=0
ws_create_node_structure_content_ERR=""

if [ "${1}" == "-?"  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_create_node_structure_content_NFO}" "${ws_create_node_structure_content_FMT}" "${ws_create_node_structure_content_EXA}"
#--------------------------------------------------------------------------------
else


# Crea enlace al proyecto
# lnk /brqx/base/html/designs/node  /home/ser/zg/main/es/zdom/arq/node/zg_main_node/es/index1
# v01

echo "lnk ${FULL_DESIGN_PATH}/${FLOW_VERSION}  ${LAN_PAGE_PATH_FOR_LINK}flow"
lnk ${FULL_DESIGN_PATH}/${FLOW_VERSION}  ${LAN_PAGE_PATH_FOR_LINK}flow 

lnk ${FULL_DESIGN_PATH}/devices  ${LAN_PAGE_PATH_FOR_LINK}devices

## echo "linking ${LAN_PAGE_PATH}index1/device  -->  ${LAN_HOME_PATH}r_device"

# Cache 2019
# lnf /brqx/pers/cache/arqdru cache
# lnf /brqx/cache/arq/drupal/arqdru
lnk /brqx/cache/${DIVISION}/${PROJECT}/${SITE} ${LAN_PAGE_PATH_FOR_LINK}cache

# Photos

lnk /ssd/${SITE} ${LAN_PAGE_PATH_FOR_LINK}photos

# Img

lnk /brqx/base/html/designs/${SITE}/img ${LAN_PAGE_PATH_FOR_LINK}r_img 


#-Flows ( flujos )

# Disabled tst dyn liv
for flow in dev ; do
lnk ${LAN_PAGE_PATH_FOR_LINK}flow/${flow}  ${LAN_PAGE_PATH_FOR_LINK}${flow}
done

# Ahqu habría que enlazar index1 con el actual flow
lnk ${LAN_PAGE_PATH_FOR_LINK}flow/${FLOW_STAGE}  ${LAN_PAGE_PATH_FOR_LINK}index1 


#-Devices
for device in desktop mobile tablet 4k ; do
lnk ${LAN_PAGE_PATH_FOR_LINK}devices/${device}  ${LAN_PAGE_PATH_FOR_LINK}${device}
done

fi
#End function
}
