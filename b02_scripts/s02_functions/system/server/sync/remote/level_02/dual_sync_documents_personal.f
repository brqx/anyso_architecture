#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#--   
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- bprx
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
#E dual_sync_documents -- Realiza un sincronismo dual de una ruta
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
dual_sync_documents()
{
VER="0.0.6"                                           ;QP="Brqx Agile Architecture 2016"

dual_sync_documents_FUN="dual_sync_documents"
dual_sync_documents_NFO="Realiza un sincronismo personal dral remoto de una ruta [$VER]($DEP) @${QP}"
dual_sync_documents_FMT="dual_sync_documents [basename]"
dual_sync_documents_EXA="dual_sync_documents StudioBrqx --> Sync personal current folder"

dual_sync_documents_OUT=0
dual_sync_documents_ERR=""

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA""
#--------------------------------------------------------------------------------
header_full "${dual_sync_documents_NFO}" "${dual_sync_documents_FMT}" "${dual_sync_documents_EXA}"
#--------------------------------------------------------------------------------
else

#-Backup personal local folder
#-Las rutas para cosas personales son distintas a los sites. Requieren su propia funcion
#-Esta pendiende de crear....
 
#-Sincronismo bidereccional. Borra y actualiza contenidos. Con unison
#-Lo que recibe es un identificador para Unison. Debera existir el proyecto prf de dicho ID

DOCU=$1

if [ "${DOCU}" == "" ]  ; then
DOCU=testdocu  
fi

USER=root

PORT=60022

#-Con unison ejecutamos un perfil por lo que no es necesario pasar argumentos

echo "Syncing ${DOCU} Zc"
unison ${DOCU}_zc                         &> /dev/null
echo "Syncing ${DOCU} Zd"
unison ${DOCU}_zd                         &> /dev/null
echo "Syncing ${DOCU} Zt"
unison ${DOCU}_zt                         &> /dev/null
 
echo "END Syncing ${DOCU}"


for cad in ar fp lk ; do

COMMAND="rm -f /root/.unison/${cad}* "
EMPTY="A"
COMMAND_02='echo A > /root/.unison/unison.log'
COMMAND_03="eval ${COMMAND_02}"

${COMMAND}
eval ${COMMAND_02}

ssh -oPasswordAuthentication=no -oPort=${PORT} ${USER}@cbrqx.com "${COMMAND}"  &> /dev/null
ssh -oPasswordAuthentication=no -oPort=${PORT} ${USER}@dbrqx.com "${COMMAND}"  &> /dev/null
ssh -oPasswordAuthentication=no -oPort=${PORT} ${USER}@tbrqx.com "${COMMAND}"  &> /dev/null


ssh -oPasswordAuthentication=no -oPort=${PORT} ${USER}@cbrqx.com "${COMMAND_03}"  # &> /dev/null
ssh -oPasswordAuthentication=no -oPort=${PORT} ${USER}@dbrqx.com "${COMMAND_03}"  # &> /dev/null
ssh -oPasswordAuthentication=no -oPort=${PORT} ${USER}@tbrqx.com "${COMMAND_03}"  # &> /dev/null

done



fi

}
