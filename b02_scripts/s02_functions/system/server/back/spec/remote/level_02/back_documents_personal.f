#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- back_documents
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- bprx
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Realiza un backup remoto de una ruta
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T make remote backup path
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P [PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E back_documents /abc/dd -- Realiza un backup remoto de las rutas
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
back_documents()
{
VER="0.0.2"                                           ;QP="Brqx Agile Architecture 2016"

back_documents_FUN="back_documents"
back_documents_NFO="Realiza un backup personal remoto de una serie de rutas [$VER]($DEP) @${QP}"
back_documents_FMT="back_documents [PATH]"
back_documents_EXA="back_documents /zsync/Documentos /zsync/AA --> Sync personal current folder"

back_documents_OUT=0
back_documents_ERR=""

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA""
#--------------------------------------------------------------------------------
header_full "${back_documents_NFO}" "${back_documents_FMT}" "${back_documents_EXA}"
#--------------------------------------------------------------------------------
else

#-Backup personal local folder
#-Las rutas para cosas personales son distintas a los sites. Requieren su propia funcion
#-Esta pendiende de crear....
 
for ruta in "${@}" ; do
##echo ${ruta}

echo "Backing $ruta - Zt"
bprx ${ruta} tbrqx.com 

echo "Backing $ruta - Zc"
bprx ${ruta} cbrqx.com 

echo "Backing $ruta - Zd"
bprx ${ruta} dbrqx.com 

 
done 


fi

}
