#!/bin/bash
#
# Script version 0.0.0.1
#
# Ejecuta bash en el contenedor
# alias azs

azure_ssh()
{
VER="0.0.0.1"
##"${1}" == "-?" -o

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Hace un ssh a a una VM de Azure usando la KEY guardada en Arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : azs | azs [VM KEY USER]                "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Ejemplo Conexion

sshp -i /Users/macminii7/.ssh/azure azureuser@51.124.36.184

# Ejemplo Copia

scpp  -ri /Users/macminii7/.ssh/azure  * azureuser@20.107.76.31:/brqx/base/rcode/

# Hooks para kubernetes
#__k

# Pendiente

az vm list --show-details --output table


fi
}

#-------------------------------------------------------------------

