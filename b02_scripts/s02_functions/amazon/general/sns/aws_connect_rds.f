#!/bin/bash
#---------------------------------------------------------------------------------
#
# Script version 0.0.3
# 2021 - November
# Farmacia Zaragoza - Brqx Architectures
#
# Fast Connect to Instance to any port
# alias aw2s --> SSH to instance
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
aws_connect_ec2()
{
VER="0.0.1"
##"${1}" == "-?" -o


if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Conexion a una instancia EC2 con Agent Forwarding [$VER]			"
echo "=========================================================="
echo "Format  : aw2s | aws_connect_ec2 IP_instancia [SSH_PORT] [SSH_USER]  "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

IP_INSTANCIA=$1
SSH_PORT=$2
SSH_USER=$3

if    [ "${SSH_USER}" == "" ] ; then
#Common user for Aws
SSH_USER=ec2-user
fi

if    [ "${SSH_PORT}" == "" ] ; then
#Common port for Aws
#The idea is to change to 60022
SSH_PORT=60022
fi

ssh -A -oPort=${SSH_PORT} ${SSH_USER}@${IP_INSTANCIA}

#ssh - A ${SSH_USER}@${IP_INSTANCIA}

fi
}

