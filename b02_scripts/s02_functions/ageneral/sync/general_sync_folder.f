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

brqx_sync_to()
{
VER=0.0.2
# Hay que insertar un seguro de FOLDER

if [ "${FOLDER}" != "" ] ; then 
SOURCE=$1
OLD_PATH=${PWD}
cd ${SOURCE}

echo "Sincronizando ${SOURCE} en ${SERVER} ${VER}"
#xfrom_mac
# Queremos sincronizar desde Library siempre
rsync -avz --exclude="*lock*" --exclude=".DS_Store" --update --omit-dir-times -e "ssh -oPort=${PORT}" ${PWD}/  ${USER}@${SERVER}:$PWD/  

rsync -avz --exclude="*lock*" --exclude=".DS_Store" --update --omit-dir-times -e "ssh -oPort=${PORT}" ${USER}@${SERVER}:$PWD/ ${PWD}/   

chmod -R 775 ${SOURCE}
chown -R ${USERPERMS} ${SOURCE}

# Falla en la botica al ser apache
if [ "${SERVER}" != "8325.coessegur.net" ] ; then
echo "CAMBIANDO PROPIETARIOS"
ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} "chmod -R 775 ${SOURCE} " 
# Falla en la botica al ser apache
ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} "chown -R ${USERPERMSRMT} ${SOURCE} " 
fi

cd ${OLD_PATH}
#echo "End Sync"
fi
}

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# XYN - SINCRONISMO ESPECIFICO HACIA GOOGLE CLOUD
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

#--------------------------------------------------------------------------------------
# Elimina los ficheros en destino - Es un sincronismo
rclone_sync_to_google_cloud()
{
FOLDER=$1

# Sincronismo hacia google drive
rclone sync --create-empty-src-dirs /ssd/${FOLDER} mygdrive:${FOLDER}

}

#--------------------------------------------------------------------------------------
# Elimina los ficheros en destino - Es un sincronismo
rclone_to_google_cloud()
{
FOLDER=$1

# Sincronismo hacia google drive
rclone copy --create-empty-src-dirs /ssd/${FOLDER} mygdrive:${FOLDER}

}

#--------------------------------------------------------------------------------------
# No elimina los ficheros
rclone_from_google_cloud()
{
FOLDER=$1

# Sincronismo hacia google drive
#rclone copy --create-empty-src-dirs  mygdrive:${FOLDER} /ssd/${FOLDER}
rclone copy --create-empty-src-dirs --max-age 24h --no-traverse  mygdrive:${FOLDER} /ssd/${FOLDER}

}

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# XYN - SINCRONISMO ESPECIFICO HACIA LOS EQUIPOS
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Sincronismo hacia lenovo
xyn_leno()
{
FOLDER=$1
SERVER=lenovo ; PORT=60022 ; USER=ric  ; USERPERMS=ric ; USERPERMSRMT=ric
brqx_sync_to ${FOLDER}
}

# Sincronismo hacia mac mini i7
xyn_mac7()
{
FOLDER=$1
SERVER=maci7 ; PORT=22 ; USER=macminii7  ; USERPERMS=macminii7 ; USERPERMSRMT=macminii7 
brqx_sync_to ${FOLDER}
}

# Sincronismo hacia mac mini i7
xyn_mac_salon()
{
FOLDER=$1
SERVER=mac_salon ; PORT=22 ; USER=ric  ; USERPERMS=ric
brqx_sync_to ${FOLDER}
}

# Sincronismo hacia mac mini i7
xyn_farm()
{
# No funciona el cambio de usuario apache 
# Linea de cron */10 9-19 * * * chmod -R 775 /ssd/Documentos && chown -R apache. /ssd/Documentos &> /dev/null

FOLDER=$1
SERVER=8325.coessegur.net ; PORT=60022 ; USER=ric  ; USERPERMS=ric
brqx_sync_to ${FOLDER}
}

# Sincronismo hacia mac mini i7
xyn_hetz()
{
FOLDER=$1
SERVER=zbrqx.com ; PORT=60022 ; USER=ric  ; USERPERMS=ric
brqx_sync_to ${FOLDER}
}

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# SYN_FOR - SINCRONISMO ESPECIFICO PARA LOS EQUIPOS
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

xyn_for_lenovo()
{
xyn_farm ${DOCS_FOLDER}a
xyn_farm ${DOCS_FOLDER}c

xyn_mac7 ${DOCS_FOLDER}a
xyn_mac7 ${DOCS_FOLDER}c
}

xyn_for_revo()
{
xyn_lenovo ${DOCS_FOLDER}a
xyn_lenovo ${DOCS_FOLDER}c
}

xyn_for_macsalon()
{
xyn_lenovo ${DOCS_FOLDER}a
xyn_lenovo ${DOCS_FOLDER}c
}

## xyn_for_lenovo
