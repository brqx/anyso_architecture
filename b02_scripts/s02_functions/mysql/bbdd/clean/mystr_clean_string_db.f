#!/bin/bash
#---------------------------------------------------------------- 
#- Funciones de manipulacin SQL
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
#- mystr
#---------------------------------------------------------------- 


mystr_clean()
{
goVER="0.0.1"
DB_FILTER=$1

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Listado de Bases de Datos	en una linea [$VER]				"
echo "=========================================================="
echo "Format  : mystr	[FILTRO_DB]								"
echo "----------------------------------------------------------"
echo "Example : mystr was_p50was --> Genera cadena con BD de was"
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
else

mystr_clean_OUT=$(mylist "${DB_FILTER}" | tr "\n" " " )

fi
}
