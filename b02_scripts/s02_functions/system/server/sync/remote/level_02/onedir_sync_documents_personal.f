#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- onedir_sync_documents  
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- srxto
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Realiza un sincronismo remoto bidireccional de una ruta
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T make remote dual sync path
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P [PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E onedir_sync_documents /abc/dd -- Realiza un sincronismo remoto unidireccional
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
onedir_sync_documents()
{
VER="0.0.2"                                           ;QP="Brqx Agile Architecture 2016"

onedir_sync_documents_FUN="onedir_sync_documents"
onedir_sync_documents_NFO="Realiza un sincronismo personal remoto de una ruta [$VER]($DEP) @${QP}"
onedir_sync_documents_FMT="onedir_sync_documents [PATH]"
onedir_sync_documents_EXA="onedir_sync_documents --> Sync personal current folder"

onedir_sync_documents_OUT=0
onedir_sync_documents_ERR=""

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA""
#--------------------------------------------------------------------------------
header_full "${onedir_sync_documents_NFO}" "${onedir_sync_documents_FMT}" "${onedir_sync_documents_EXA}"
#--------------------------------------------------------------------------------
else

#-Backup personal local folder
#-Las rutas para cosas personales son distintas a los sites. Requieren su propia funcion
#-Esta pendiende de crear....
 
#-Sincronismo bidereccional. Borra y actualiza contenidos. Con unison

DOCU=$1

if [ "${DOCU}" == "" ]  ; then
DOCU=testdocu  
fi

#-Con unison ejecutamos un perfil por lo que no es necesario pasar argumentos

echo "Syncing OneDir ${DOCU} Zc"
srxto cbrqx.com /zsync/${DOCU} /zsync/${DOCU} 

echo "Syncing OneDir ${DOCU} Zd"
srxto dbrqx.com /zsync/${DOCU} /zsync/${DOCU} 

echo "Syncing OneDir ${DOCU} Zt"
srxto tbrqx.com /zsync/${DOCU} /zsync/${DOCU} 

fi

}
