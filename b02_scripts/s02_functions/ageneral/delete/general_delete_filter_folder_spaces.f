#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org - Linux - MACOS
# Farmacia Zaragoza - Brqx Architectures - Rct - 2021
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Version Fichero : v0.0.0.3 -- Noviembre 2021
#
# Sincronismo pendiente
#-------------------------------------------------------------------

# alias pendiente

##FECHA=$(date +%G_%m_%d_%H-%M)
##2022_01_14_09-30
FECHA=$(date +%G_%m)
##2022_01

SYNC_LOG_FILE=${TMPDIR}zsync_cron_${FECHA}.log

##DOCS_FOLDER=/Library/Documentos/
DOCS_FOLDER=/Library/ric/testsync/

# farmacia=$(dig +short 8325.coessegur.net | grep -v webhop)

# Funcion que recibe usa variables definidas
# - Directorios SOURCE y TARGET
# - Servidor remoto USER - SERVER y PORT
# - Ejemplo Library/dir1

#------------------------------------------------------------------------------------------------

brqx_filter_delete_to_spaces_local()
{
VER=0.0.2
# Hay que insertar un seguro de FOLDER

if [ "${FOLDER}" != "" ] ; then 
SOURCE=$1
OLD_PATH=${PWD}
cd ${SOURCE}

echo "Eliminando carpetas filtradas ${SOURCE} en ${SERVER} ${VER}"
#xfrom_mac
# Borrado local

CARPETAS_A_BORRAR=${TMPDIR}carpetas_a_borrar.dat


find . -type d -name "*_BORRAR" | sed "s/ /=/g" > ${CARPETAS_A_BORRAR}_totales

cat ${CARPETAS_A_BORRAR}_totales | grep "="    > ${CARPETAS_A_BORRAR}_espacios
cat ${CARPETAS_A_BORRAR}_totales | grep -v "=" > ${CARPETAS_A_BORRAR}_sin_espacios

#  echo "Borrando carpetas con espacios"

for carpeta_con in $( cat ${CARPETAS_A_BORRAR}_espacios ) ; do

carpeta="$(echo ${carpeta_con} | sed 's/=/ /g')"

## echo "Analizando - $carpeta"
relacionada=$(echo ${carpeta} | sed "s/_BORRAR//g" )

if [ -d "${carpeta}" ] ; then
## echo "Borrando carpeta ${carpeta}"
rm -rf "${carpeta}" 2> /dev/null
fi

if [ -d "${relacionada}" ] ; then
## echo "Borrando carpeta ${relacionada}"
rm -rf "${relacionada}" 2> /dev/null
fi

done

for carpeta in $( cat ${CARPETAS_A_BORRAR}_sin_espacios ) ; do

## echo "Analizando - $carpeta"
relacionada=$(echo ${carpeta} | sed "s/_BORRAR//g" )

if [ -d "${carpeta}" ] ; then
## echo "Borrando carpeta ${carpeta}"
rm -rf "${carpeta}" 2> /dev/null
fi

if [ -d "${relacionada}" ] ; then
## echo "Borrando carpeta ${relacionada}"
rm -rf "${relacionada}" 2> /dev/null
fi

done

cd ${OLD_PATH}
fi
}

#------------------------------------------------------------------------------------------------

brqx_filter_delete_to_spaces_remote()
{
VER=0.0.2
# Hay que insertar un seguro de FOLDER

#---=== G E S T I O N   R E M O T A ---===

SOURCE=$1

# Esperamos 1 segundo
nc -z ${SERVER} ${PORT} -w 1
READY_TO_SYNC=$?

if [ "${READY_TO_SYNC}" == "0" ] ; then
#Ready to sync

EXISTE_RUTA=$(ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} "ls -1 ${SOURCE} | wc -l " )

echo "Existe Ruta ${EXISTE_RUTA} - $SOURCE - ${CARPETAS_A_BORRAR}_rmt"

if [ "${EXISTE_RUTA}" != "0" ] ; then
#Ready to sync
#--------------------------------------------------------------------------------------

ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} "mkdir ${SOURCE}/PEPE_BORRAR"

ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} "find ${SOURCE} -type d -name '*_BORRAR'| sed 's/ /=/g' "  > ${CARPETAS_A_BORRAR}_rmt  #2> /dev/null

cat c_rmt | grep "="    > ${CARPETAS_A_BORRAR}_espacios
cat ${CARPETAS_A_BORRAR}_rmt | grep -v "=" > ${CARPETAS_A_BORRAR}_sin_espacios

echo "Carpetas Remotas" 

cat "${CARPETAS_A_BORRAR}_rmt"

#ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} "cat ${CARPETAS_A_BORRAR}_rmt"

echo "Fin Carpetas remotas"

for carpeta_con in $( cat ${CARPETAS_A_BORRAR}_espacios ) ; do

carpeta="$(echo ${carpeta_con} | sed 's/=/ /g')"
relacionada=$(echo ${carpeta} | sed "s/_BORRAR//g" )

# echo "Borrando carpeta remota ${carpeta}"
ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} "rm -rf \"${carpeta}\"" 2> /dev/null

# echo "Borrando carpeta remota ${relacionada}"
ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} "rm -rf \"${relacionada}\"" 2> /dev/null
#rm -rf $carpeta

done


for carpeta in $( cat ${CARPETAS_A_BORRAR}_sin_espacios ) ; do

relacionada=$(echo ${carpeta} | sed "s/_BORRAR//g" )

# echo "Borrando carpeta remota ${carpeta}"
ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} "rm -rf ${carpeta}"     2> /dev/null

# echo "Borrando carpeta remota ${relacionada}"
ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} "rm -rf ${relacionada}" 2> /dev/null

done

else

echo "Ruta no existe para sincronizar/fiter delete en  ${SERVER} : ${PORT} - > ${SOURCE} "

#END Existe ruta
#--------------------------------------------------------------------------------------
fi 

else
echo "Server ${SERVER} : ${PORT} not ready to sync-filter-delete"

#END Ready to sync
#--------------------------------------------------------------------------------------
fi

}


brqx_filter_delete_to_spaces()
{
VER=0.0.2
# Hay que insertar un seguro de FOLDER

CARPETAS_A_BORRAR=${TMPDIR}carpetas_a_borrar.dat

brqx_filter_delete_to_spaces_local

brqx_filter_delete_to_spaces_remote

}

# Sincronismo hacia mac mini i7
filter_delete_mac7()
{
if [ "$1" == "" ] ; then
FOLDER=$PWD
else
FOLDER=$1
fi

SERVER=maci7 ; PORT=22 ; USER=macminii7  ; USERPERMS=macminii7 ; USERPERMSRMT=macminii7 

CARPETAS_A_BORRAR=${TMPDIR}carpetas_a_borrar.dat

brqx_filter_delete_to_spaces_remote ${FOLDER}
}
