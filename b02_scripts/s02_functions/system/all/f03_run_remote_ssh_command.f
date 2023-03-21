#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.0"          #  Version del Script actual
FECHA_SCRIPT="Abril 2016"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#-------------------------------------------------------------------
#-- run_remote_ssh 
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- sshsure 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Sincroniza ruta actual
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T ssh connect server sure secure
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P SERVER [USER]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E run_remote_ssh SERVER -- Ejecuta un comando en servidor remoto
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
run_remote_ssh()
{
# Ejecuta un comando en un servidor remoto
VER=0.0.1

REMOTE_SERVER=$1
REMOTE_CMD=$2

if [ "${REMOTE_SERVER}" == "" -o "${REMOTE_SERVER}" == "-?" ] ; then
echo "Ejecuta un comando en un servidor remoto"
else

sshsure ${REMOTE_SERVER} "${REMOTE_CMD}" 

# Devuelve 0 cuando la ruta no existe
# Si existe ye sta vacio devolvera un 3
#-Aparte puede devolver NK o ZK en caso de no 

if		[ "${sshsure_OUT}" == "NK" ] ; then
run_remote_ssh_OUT="${SERVER}:NO_CONNECTION"
elif	[ "${sshsure_OUT}"  == "ZK" ] ; then
run_remote_ssh_OUT="${SERVER}:NO_SSH_KEYS"
else
#-Devolvera un numero
run_remote_ssh_OUT="${sshsure_OUT} "
fi


fi
}

