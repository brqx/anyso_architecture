#!/bin/bash
#
# Script version 0.0.0.1
#
# Ejecuta bash en el contenedor
# alias gic

git_checkout()
{
VER="0.0.0.1"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Cambia/Genera una nueva rama en GIT en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : gik | git_ckeckout RAMA               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Ejecuta bash en nuestro pod

INFO=$1

# Hooks para kubernetes

# Cambiamos/Generamos una nueva rama
git checkout -b "${INFO}"

# Ajustamos el path con git
check_short_paths

fi
}

#-------------------------------------------------------------------

