#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - WEIGHT ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.0"          #  Version del Script actual
FECHA_SCRIPT="Abril 2016"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#-------------------------------------------------------------------
#-- sshsure 
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
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
#E sshsure SERVER -- Sincroniza la ruta actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
sshsure()
#-Hace una conexion ssh y devuelve la salida en linea
{
SERVER=${1}
CMD="${2}"
USER=${3}

VER=0.0.6

if [ "${SERVER}" == "" -o "${CMD}" == ""  ] ; then
echo "Ejecuta una conexion ssh contra un servidor y lanza un comando. Comprueba conectividad [$VER]"
sshsure_OUT="NK"
else

if [ "${USER}" == "" ] ; then
USER=root
fi

# Algoritmo:
#
# 1-. Intenta conexion con perl al puerto 22 para ver si esta abierto
# 2.- Intenta SSH indicando que no aceptamos autenticacion sin keys
# 3.- Devolvemos resultados

##echo "Ejecuta una conexion ssh contra un servidor y lanza un comando - ${VER}"

PERL_CK=/root/scripts/arq/libs/perl/checkport.pl

#-Si da un 0 esta abierto - 1 esta cerrado
perl_OUT=$( ${PERL_CK} ${SERVER} | grep Closed | wc -l | tr -s " " | cut -c2)


if  [ "${perl_OUT}" == "0"	 ] ; then
#- Para poder acceder a cualquier maquina usamos sshx
	sshsure_OUT=$( ssh -oPasswordAuthentication=no  ${USER}@${SERVER} "${CMD}" 2> /dev/null )

	CHECK_sshsure=$(echo ${sshsure_OUT} | tr -s " " | cut -c2  )
	#-Puede ser que no se pueda entrar porque no haya intercambio de claves ssh
	if [ "${sshsure_OUT}" == ""	 ] ; then
		# O no se puede entrar en el servidor o el comando devuelve vacio (zero contents)
		sshsure_OUT="ZK"
	fi
else
    # Si no ha podido acceder,la funcion perl devuelve 1
	#-Hay error de conectividad con els servidor
	sshsure_OUT="NK"
fi

fi
}
