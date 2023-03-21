#!/bin/bash
#
# Script version 0.0.0.1
#
# Hace un Git con Auto Commity un Push
# alias giap

git_auto_push_origin()
{
VER="0.0.0.1"
##"${1}" == "-?" -o

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Hace un push origin con comentario a la rama actual seleccionada en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : giap | git_auto_push_origin INFO               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Automatiza los commit en Git

INFO="${*}"

# Git add
git add .

# Git commit

git commit -am "${INFO}"

# Git push origin solving

git_push_origin


fi
}

#-------------------------------------------------------------------

