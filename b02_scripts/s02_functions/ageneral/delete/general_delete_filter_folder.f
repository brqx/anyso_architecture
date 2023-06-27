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

brqx_filter_delete_to()
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

find . -type d -name "*_BORRAR" > ${CARPETAS_A_BORRAR}

echo "Borrando carpetas"

for carpeta in $( cat ${CARPETAS_A_BORRAR} ) ; do
relacionada=$(echo ${carpeta} | sed "s/_BORRAR//g" )

if [ -d ${carpeta} ] ; then
# echo "Borrando carpeta ${carpeta}"
rm -rf ${carpeta} 2> /dev/null
fi

if [ -d ${relacionada} ] ; then
# echo "Borrando carpeta ${relacionada}"
rm -rf ${relacionada} 2> /dev/null
#rm -rf $carpeta
fi

done
#rm -rf $carpeta



# Borrado de carpetas remote
ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} "find ${SOURCE} -type d -name '*_BORRAR'" > ${CARPETAS_A_BORRAR}_rmt 2> /dev/null

for carpeta in $( cat ${CARPETAS_A_BORRAR}_rmt ) ; do
relacionada=$(echo ${carpeta} | sed "s/_BORRAR//g" )

if [ -d ${carpeta} ] ; then
# echo "Borrando carpeta remota ${carpeta}"
ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} "rm -rf ${carpeta}" 2> /dev/null
fi

if [ -d ${relacionada} ] ; then
# echo "Borrando carpeta remota ${relacionada}"
ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} "rm -rf ${relacionada}" 2> /dev/null
#rm -rf $carpeta
fi

done


# Falla en la botica al ser apache

cd ${OLD_PATH}
#echo "End Sync"
fi
}


#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# XYN - SINCRONISMO - BORRADO DE CARPETAS EN TODOS LOS EQUIPOS
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Sincronismo hacia lenovo
filter_delete_leno()
{
FOLDER=$1
SERVER=lenovo ; PORT=60022 ; USER=ric  ; USERPERMS=ric ; USERPERMSRMT=ric
brqx_filter_delete_to_spaces ${FOLDER}
}

# Sincronismo hacia mac mini i7
filter_delete_mac7()
{
FOLDER=$1
SERVER=maci7 ; PORT=22 ; USER=macminii7  ; USERPERMS=macminii7 ; USERPERMSRMT=macminii7 
brqx_filter_delete_to_spaces ${FOLDER}
}

# Sincronismo hacia mac mini i7
filter_delete_mac_salon()
{
FOLDER=$1
SERVER=mac_salon ; PORT=22 ; USER=ric  ; USERPERMS=ric
brqx_filter_delete_to_spaces ${FOLDER}
}

# Sincronismo hacia mac mini i7
filter_delete_farm()
{
# No funciona el cambio de usuario apache 
# Linea de cron */10 9-19 * * * chmod -R 775 /ssd/Documentos && chown -R apache. /ssd/Documentos &> /dev/null

FOLDER=$1
SERVER=8325.coessegur.net ; PORT=60022 ; USER=ric  ; USERPERMS=ric
brqx_filter_delete_to_spaces ${FOLDER}
}

# Sincronismo hacia mac mini i7
filter_delete_hetz()
{
FOLDER=$1
SERVER=zbrqx.com ; PORT=60022 ; USER=ric  ; USERPERMS=ric
brqx_filter_delete_to_spaces ${FOLDER}
}

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# SYN_FOR - SINCRONISMO ESPECIFICO PARA LOS EQUIPOS
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

filter_delete_for_lenovo()
{
filter_delete_farm ${DOCS_FOLDER}a
filter_delete_farm ${DOCS_FOLDER}c

filter_delete_mac7 ${DOCS_FOLDER}a
filter_delete_mac7 ${DOCS_FOLDER}c
}

filter_delete_for_revo()
{
filter_delete_leno ${DOCS_FOLDER}a
filter_delete_leno ${DOCS_FOLDER}c
}

filter_delete_for_macsalon()
{
filter_delete_leno ${DOCS_FOLDER}a
filter_delete_leno ${DOCS_FOLDER}c
}

## xyn_for_lenovo
