#!/bin/bash
#
# Script version 0.0.2
#
#Importa por completo una BD mysql en una ruta indicada
#example mydbex path
myalldbim()
{
VER="0.0.2"
#-El nombre de la bd es una concatenacion
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Importa por completo la BD en formato SQL [$VER]	        "
echo "=========================================================="
echo "Format  : mydbim PATH                                     "
echo "----------------------------------------------------------"
echo "Example : mydbim /sata/mysql/export					    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
INPUT_FOLDER=${1}

if [ "${INPUT_FOLDER}" == "" ] ; then
INPUT_FOLDER="/sata/dbs/"
fi

# Cadenas de busqueda y reemplazo

echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Importa por completo la BD en formato SQL [$VER]	        "
echo "----------------------------------------------------------"
echo "Ruta Destino : ${INPUT}									"
echo "----------------------------------------------------------"


#rm "$OUTPUTDIR/*gz" > /dev/null 2>&1

#databases=$(mysql -u $USER -e "SHOW DATABASES;" | tr -d "| " | grep -v Database)
#databases=$(mysql -u $USER --batch --skip-column-names -e "SHOW DATABASES;" | grep -E -v "(information|performance)_schema")
USER="root"
INPUT="/sata/dbs/"

OLD_PATH=${PWD}

cd ${INPUT_FOLDER}


databases=$( ls -1 ${INPUT_FOLDER} )

#- Formato : 20151012.mag_d20test.sql

OUTOUT="CLEAN"

for db in ${databases} ; do
echo "Importando : ${db} ${INPUT_FOLDER}"
myim ${db} ${INPUT_FOLDER}
done
OUTOUT=""


cd ${OLD_PATH}
fi

}
