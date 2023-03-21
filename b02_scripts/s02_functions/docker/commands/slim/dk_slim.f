#!/bin/bash
#
# Script version 0.0.1
#
# 
# alias dks

#---------------------------------------------------------------

dk_slim()
{
VER="0.0.1"
##"${1}" == "-?" -o


if [ "${1}" == "" -o "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Elimina las capas de docker generando una imagen de menor peso en arquitectura Brqx [$VER]						"
echo "=========================================================="
echo "Format  : dks | dk_slim [IMAGE]                         "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

IMAGE_passed=${1}


# Hook Image
__image

# Dos modos de funcionamiento

# 1. Imagen pasada
# 2. Variable de entorno

if [ "${IMAGE_inner}" != ""  ] ; then
#----====----====----====----====----====----====----====----====
#           I N I C I O    D E   L A    L O G I C A 
#----====----====----====----====----====----====----====----====

docker-slim build --http-probe=false -target ${IMAGE_inner} \
--include-path /data/web/example.html \
--include-path /etc \
--include-path /usr/bin \
--include-path /usr/local \
--include-path /bin \
--include-path /lib \
--include-path /lib64 \
--include-path /data/web \
--include-path /var/empty \
--include-path /home \
--include-path /usr/sbin

#----====----====----====----====----====----====----====----====
#              F I N    D E   L A    L O G I C A 
#----====----====----====----====----====----====----====----====

fi


fi
}

