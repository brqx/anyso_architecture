#!/bin/bash
#
# Script version 0.0.0.1
#
# Ejecuta bash en el contenedor
# alias gic

git_commit()
{
VER="0.0.0.1"
##"${1}" == "-?" -o

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Hace un commit de Git a la rama actual seleccionada en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : gic | git_commit INFO               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Ejecuta bash en nuestro pod

INFO=${*}

# Hooks para kubernetes
#__k

# Pendiente
git commit -am "${INFO}"

fi
}

#-------------------------------------------------------------------

