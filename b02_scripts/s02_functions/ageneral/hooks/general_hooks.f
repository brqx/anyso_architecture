#!/bin/bash
#---------------------------------------------------------------------------------
#
# Script version 0.0.2 -- 2021 - November
# Farmacia Zaragoza - Brqx Architectures
#
# AWS Hooks for functions
#
# __tmp_file : Manage TMP files
# __image    : Manage IMAGE params ( Git / ECR / Docker)
#
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Manage TMP files for Aws commands
__tmp_file()
{
if [ "${TMP_FILE}" == "" ] ; then
TMP_FILE="/tmp/output_command_brqx"
fi
}

#----------------------------------------------------------------------------------
# Hook general para manejar imagenes

__image()
{

#Imagen generada
if [ "${IMAGE_passed}" != "" ] ; then
IMAGE_innner=${IMAGE_passed}
else
IMAGE_innner=${IMAGE}
fi
}
