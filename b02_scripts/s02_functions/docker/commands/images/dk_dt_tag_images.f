#!/bin/bash
#
# Script version 0.0.0.1
#
# Listado de imágenes
# alias dt

dt_tag_latest()
{
VER="0.0.0.1"
##"${1}" == "-?" -o

if [ "${1}" == "-?" -o "${1}" == "" -o ${2} == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Tags agiles para imagenes en Docker en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : dtl | dt_tag_latest IMAGE TAG               "
echo "Example : dtl helloworld 2.0                              "
echo "No esta funcionando"
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Va a taggear la ultima imagen del filtro pasado como latest
# Parece un poco caotico

FILTRO=${1}
DVER=${2}

# Hooks para docker
__d
__d_file

if [ "${DVER}" != "" ] ; then
#Hay un filtro
docker images | grep "${DVER}" | grep -v latest | head -1   > ${TMP_FILE}

else
#No hay filtro cogemos la ultima

docker images | grep -v latest | head -1   > ${TMP_FILE}

fi

INAME=$(cat ${TMP_FILE} | tr -s " " | cut -d " " -f1 )
ITAG=$(cat ${TMP_FILE} | tr -s " " | cut -d " " -f2  )

echo "Taggeando ${INAME} con tag ${ITAG} "

docker tag ${INAME}:${ITAG} ${INAME}:latest


fi
}

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

dt_tag()
{
VER="0.0.0.1"
##"${1}" == "-?" -o


if [ "${1}" == "-?" -o "${1}" == "" -o "${2}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Tags agiles para imagenes en Docker en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format    : dtag | dt_tag [IMAGE] [TAG] [TAG2]                "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Example   : dtag helloworld 3.0 latest"
echo "Alternate : dtl helloworld 3.0 --> dtag latest                             "
echo "=========================================================="

else

IMAGEN=${1}
TAG=${2}
TAG2=${3}

# Hooks para docker (define defaults d)
__d

if [ "${TAG2}" == "" ] ; then
#Hay un filtro

dt_tag_latest ${IMAGEN} ${TAG}

else
#Se han pasado los tags

docker tag ${IMAGEN}:${TAG} s{IMAGEN}:${TAG2}

fi

fi
}
