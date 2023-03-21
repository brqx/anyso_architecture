#!/bin/bash
#---------------------------------------------------------------- 
#- Funciones de manipulacin SQL
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
#- mycp - mycr - mydr - mymv - mycptmp
#---------------------------------------------------------------- 


#Copia una BD en otra (la borra si existe previamente)
#example mycp bd_01 bd_02
myalter_format()
{
DBUSER=root
DBPASSWORD=
DBSNAME=$1

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Altera ROW_FORMAT en base de datos                        "
echo "=========================================================="
echo "Format  : myalter BASE_DATOS                              "
echo "----------------------------------------------------------"
echo "Example : mycp was_p50was a_p50w --> Copia BD was en a    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
else


echo "Altering Row Format database ... ${DBSNAME} (may take a while ...)"

DBCONN=" -u ${DBUSER} "
# Preparamos los insert
for TABLE in $(echo "SHOW TABLES" | mysql $DBCONN $DBSNAME | tail -n +2 ) ; do
alterTable=$(echo "ALTER TABLE ${TABLE} ROW_FORMAT=Compressed ;" ) 
alterTables="${alterTables}${alterTable}" 
done;
# To use with INNODB
echo "set foreign_key_checks = 0; $alterTables ; set foreign_key_checks = 1;" | mysql $DBCONN $DBNAME

fi
}

myalter_list()
{
if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Lista ROW_FORMAT en base de datos                        "
echo "=========================================================="
echo "Format  : myalter_list "
echo "----------------------------------------------------------"
echo "Example : myalter_list                                    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
else
 # De momento no funciona

echo "Listing Row Format database ... ${DBSNAME} (may take a while ...)"

DBCONN=" -u ${DBUSER} "
echo "SELECT table_name, row_format FROM mysql.information_schema.tables WHERE table_schema = $DBSNAME" | mysql $DBCONN $DBNAME

fi


}