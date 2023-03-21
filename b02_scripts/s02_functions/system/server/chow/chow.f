#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.9" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- chow
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Cambia permisos y propietaros para dar agilidad al chmod y chown en servidores
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T get values settings file
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [FILES OR FOLDER LIST]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E chow [FINDLINE] -- Obtinee valores para la FINDLINE
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
chow()
{
VER="0.0.9"

chow_FUN="chow"
chow_NFO="Cambia permisos y propietaros para dar agilidad al chmod y chown en servidores [$VER]"
chow_FMT="chow [FILES OR FOLDER LIST]"
chow_EXA="chow A B C"

chow_OUT=0
chow_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_mainline_NFO}" "${chow_FMT}" "${chow_EXA}"
#--------------------------------------------------------------------------------
else

#-No podemos ni debemos usar path como variable de un for ya que es una variable del sistema

for ruta in "${@}" ; do
##echo ${i}
##Never path must be / nor /root

if [ "${ruta}" != "/" -a  "${ruta}" != "/root"  -a "${ruta}" != "/etc" -a "${ruta}" != "/usr" -a "${ruta}" != " " -a "${ruta}" != "*"  ] ; then
chown -R apache:apache ${ruta}							&> /dev/null
chmod -R 775 ${ruta}									&> /dev/null
chmod_COD=$?

chow_OUT=$(expr  ${chow_OUT} + ${chmod_COD})			&>	/dev/null

if [ "${chmod_COD}" != "0" ] ; then
chow_EER="#-E${chmod_COD}:Problem changing perms : ${ruta} ##"
chow_ERR="${chow_ERR}${chow_EER}"
fi


else
chow_COD=45
chow_OUT=$(expr  ${chow_OUT} + ${chow_COD})
chow_EER="#-E${chow_COD}:Problem changing perms or path forbidden : ${ruta}  ##"
chow_ERR="${chow_ERR}${chow_EER}"

fi

done

fi

}
