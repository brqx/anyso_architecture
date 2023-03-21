#!/bin/bash
#---------------------------------------------------------------- 
#- Funciones de manipulacin SQL
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
#- mycp - mycr - mymv - mycptmp
#---------------------------------------------------------------- 


#-Borra BDD - Delete Database
#example mydr bd_01 
mydr()
{
DBUSER=root
DBPASSWORD=
DBNAME=$1

if [ "${1}" == "-?" -o  "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Elimina una base de datos									"
echo "=========================================================="
echo "Format  : mydr BASE_DATOS									"
echo "----------------------------------------------------------"
echo "Example : mydr was_p50was --> Borra la BD was_p50was      "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
else

fCreateTable=""
fInsertData=""
echo "Deleting database ... ${DBNAME}"

DBCONN=" -u ${DBUSER} "
echo "DROP DATABASE IF EXISTS ${DBNAME}" | mysql ${DBCONN}

fi
}

