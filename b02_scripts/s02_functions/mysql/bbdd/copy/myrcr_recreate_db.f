#!/bin/bash
#---------------------------------------------------------------- 
#- Funciones de manipulacin SQL
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
#- mycr - mydr
#---------------------------------------------------------------- 


#Recreate una BD en otra (la borra si existe previamente)
#example mycp bd_01 bd_02
myrcr()
{
DBNAME=$1

if [ "${1}" == "-?"  ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Regenera una base de datos								"
echo "=========================================================="
echo "Format  : myrcr BASE_DATOS								"
echo "----------------------------------------------------------"
echo "Example : myrcr was_p50was --> Regenera BBDD				"
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
else

mydr ${DBNAME}
mycr ${DBNAME}

fi
}



#Convierte una BBDD a Innodb
#example mycp bd_01 bd_02
mycpin()
{
DBUSER=root
DBPASSWORD=
DBSNAME=$1
DBNAME=$2

if [ "${1}" == "-?" -o  "${2}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Copia una base de datos en otra                            "
echo "=========================================================="
echo "Format  : mycp BASE_DATOS BASE_DATOS                        "
echo "----------------------------------------------------------"
echo "Example : mycp was_p50was a_p50w --> Copia BD was en a    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
else


fCreateTable=""
fInsertData=""
echo "Copying database ... ${DBSNAME} in ${DBNAME} (may take a while ...)"

DBCONN=" -u ${DBUSER} "
echo "DROP DATABASE IF EXISTS ${DBNAME}" | mysql ${DBCONN}
echo "CREATE DATABASE ${DBNAME}" | mysql ${DBCONN}
# Preparamos los insert
for TABLE in $(echo "SHOW TABLES" | mysql $DBCONN $DBSNAME | tail -n +2 ) ; do
createTable=$(echo "SHOW CREATE TABLE ${TABLE}" |mysql -B -r $DBCONN $DBSNAME|tail -n +2|cut -f 2-)
fCreateTable="${fCreateTable} ; ${createTable}"
insertData="INSERT INTO ${DBNAME}.${TABLE} SELECT * FROM ${DBSNAME}.${TABLE}"
fInsertData="${fInsertData} ; ${insertData}"
done;

fInsertInnoDb="$(echo ${fInsertData}  | sed 's/MyISAM/INNODB/g'  )"
fCreateInnoDb="$(echo ${fCreateTable} | sed 's/MyISAM/INNODB/g'  )"


#echo "$fCreateTable ; $fInsertData" | mysql $DBCONN $DBNAME
# To use with INNODB
echo "set foreign_key_checks = 0; $fCreateInnoDb ; $fInsertInnoDb ; set foreign_key_checks = 1;" | mysql $DBCONN $DBNAME

fi
}


#-Copia una bd en otra temporal
#example mydr bd_01 
mycptmp()
{
DB_SOURCE=$1
DB_TARGET=${DB_SOURCE}_tmp

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Copia una base de datos por otra temporal                 "
echo "=========================================================="
echo "Format  : mycptmp BASE_DATOS								"
echo "----------------------------------------------------------"
echo "Example : mycptmp was_p50was --> Copia BD was a was_tmp   "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
else

mycp ${DB_SOURCE} ${DB_TARGET}

fi
}

