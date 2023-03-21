#!/bin/bash
#
# Script version 0.0.3
#
# Eliminacion de contenedores con salida - Estado None
# alias drn
drm_containers_and_images_none()
{
VER="0.0.1"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Eliminacion de contenedores con salida - Estado None en arquitectura Brqx [$VER]						"
echo "=========================================================="
echo "Format  : drn | drm_containers_and_images_none            "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Usaremos container list con los contenedores que ya han termindado

# Base
# 93128ef577d7 22f35e23db25 "/bin/sh -c 'addgrou…" 6 days ago Exited (1) 6 days ago epic_mendeleev
#9ab48211be8e alpine_nginx-brqx-2020:0.0.1 "/app/docker-entrypo…" 7 days ago Up 7 days 

__d

CONTAINERS_LIST=$(dpa | grep Exited | tr -s " " | cut -d " " -f1 | tr "\n" " ")

for cont_i in "${CONTAINERS_LIST}" ; do
docker rm ${cont_i}        &>    /dev/null
done
echo "Limpiando Contenedores ${CONTAINERS_LIST}"

#Una vez hemos eliminado los contenedores, vamos a borrar las instancias imagenes que no  queremos

drm_images_none

fi
}

# alias dri
drm_images_none()
{
VER="0.0.2"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Eliminacion de imágenes de contenedores con salida - Estado None en arquitectura Brqx [$VER]						"
echo "=========================================================="
echo "Format  : dri | drm_images_none                           "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Usaremos container list con los contenedores que ya han termindado

# Base
# 93128ef577d7 22f35e23db25 "/bin/sh -c 'addgrou…" 6 days ago Exited (1) 6 days ago epic_mendeleev
#9ab48211be8e alpine_nginx-brqx-2020:0.0.1 "/app/docker-entrypo…" 7 days ago Up 7 days 

#Una vez hemos eliminado los contenedores, vamos a borrar las instancias imagenes que no  queremos

__d

IMAGE_NONE_LIST=$( di_filter | grep "<none>" | tr -s " " | cut -d " " -f3 | tr "\n" " " )

echo "Limpiando Images ${IMAGE_NONE_LIST} "
if [ "${IMAGE_NONE_LIST}" != "" ] ; then
  for i in ${IMAGE_NONE_LIST} ; do
    echo "Limpiando $i"
    docker image rm "${i}" &> /dev/null
  done
fi

fi

}
