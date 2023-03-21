#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- onedir_synz_documents  
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
#E onedir_synz_documents /abc/dd -- Realiza un sincronismo remoto unidireccional
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
onedir_synz_documents()
{
VER="0.0.2"                                           ;QP="Brqx Agile Architecture 2016"

onedir_synz_documents_FUN="onedir_synz_documents"
onedir_synz_documents_NFO="Realiza un sincronismo personal remoto de una ruta [$VER]($DEP) @${QP}"
onedir_synz_documents_FMT="onedir_synz_documents [PATH]"
onedir_synz_documents_EXA="onedir_synz_documents --> Sync personal current folder"

onedir_synz_documents_OUT=0
onedir_synz_documents_ERR=""

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA""
#--------------------------------------------------------------------------------
header_full "${onedir_synz_documents_NFO}" "${onedir_synz_documents_FMT}" "${onedir_synz_documents_EXA}"
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

echo "Syncing Del OneDir ${DOCU} Zc"
srzto cbrqx.com /zsync/${DOCU} /zsync/${DOCU} 

echo "Syncing Del OneDir ${DOCU} Zd"
srzto dbrqx.com /zsync/${DOCU} /zsync/${DOCU} 

echo "Syncing Del OneDir ${DOCU} Zt"
srzto tbrqx.com /zsync/${DOCU} /zsync/${DOCU} 

fi

}
