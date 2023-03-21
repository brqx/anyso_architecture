#!/bin/bash
#---------------------------------------------------------------- 
#- Funciones de manipulacin SQL
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
#- mycp - mycr - mydr - mymv - mycptmp
#---------------------------------------------------------------- 



#Crea una BBDD

#example mycr bd_01
mycr()
{
DBUSER=root
DBPASSWORD=
DBNAME=$1

if [ "${1}" == "-?" -o  "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Crea una base de datos									"
echo "=========================================================="
echo "Format  : mycr BASE_DATOS									"
echo "----------------------------------------------------------"
echo "Example : mycr was_p50was --> Crea la BD was_p50was       "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
else

fCreateTable=""
fInsertData=""
echo "Creating database"
DBCONN=" -u ${DBUSER} "
echo "CREATE DATABASE ${DBNAME}" | mysql ${DBCONN}

fi
}
