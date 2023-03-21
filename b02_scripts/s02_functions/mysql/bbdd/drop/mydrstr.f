#!/bin/bash

#Elimina una BD de un servidor


mydrstr()
{
VER="0.0.2"
#-El nombre de la bd es una concatenacion

if [ "${1}" == "-?" -o  "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Borrado BD en servidor [$VER]								"
echo "=========================================================="
echo "Format  : mydrstr  FILTER 								"
echo "----------------------------------------------------------"
echo "Example : mydrstr unixy 	    	    					"
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
FILTER_DB_IN=${1}

for database in $( mystr ${FILTER_DB_IN} ) ; do
echo "Eliminando ${database}"
mydr "$database" &> /dev/null
done

fi

}

