#!/bin/bash
#
# Script version 0.0.2
#
# Listado de Subnets de AWS
# alias aw2lsubnets

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

aws_run_efs()
{
VER="0.0.1"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Fix EFS System to be accesible [$VER]						"
echo "=========================================================="
echo "Format  : awrefs | aws_run_efs [vpc]                         "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

#Casos de funcionamiento  (Pendiente)

# 1- No se pasa nada -- > Informacion de formato

# 2- Se pasa la VPC

# Mostrar las VPCs de la region actual

#Algoritmo ()

1. Crear Grupo de seguridad

2. Cambiar reglas del grupo de seguridad

TMP_FILE="/tmp/output_command_brqx"

echo "-----------------------------------------------------"


# Para obtener las redes de los EFS
#aws efs describe-mount-targets --file-system-id fs-0050f70fabb9b9cf3


fi
}

