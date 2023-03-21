#!/bin/bash
#
# Script version 0.0.3
#
#Crea una linea bonita rellena de un caracter - bien espaciada 
prtyline_set_filled()
{
VER="0.0.3"
prtyline_set_line_OUT=""

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Imprime estructuras para el dominio preseleccionado"
echo "=========================================================="
echo "Format  : wsdg_show_lines [file_waf] [file_loc]                 		"
echo "----------------------------------------------------------"
echo "Example : wsndg domains.waf                               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

if [ "${FILLED_CHAR}" == " " ] ; then
#-Por defecto el caracter de relleno es el guion
FILLED_CHAR="-"
fi

prtyline_set_line "${@}"

prtyline_set_filled_OUT="${prtyline_set_line_OUT}"
fi
}
