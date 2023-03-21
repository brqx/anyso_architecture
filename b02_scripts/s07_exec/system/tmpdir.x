#!/bin/bash
#
# Script version 0.0.2
#
# Definicion de ruta temporal - Compatibilidad MACOS

if [ "${TMPDIR}" == "" ] ; then
#Ruta para Linux
TMPDIR=/tmp/
fi

