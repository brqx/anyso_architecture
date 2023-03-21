#!/bin/bash
#
# Script version 0.0.4
#
#Importa por completo una BD mysql en una ruta indicada
#example myim database
myfim()
{
VER="0.0.4"
#-El nombre de la bd es una concatenacion
##"${1}" == "-?" -o

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Importa por completo una BD en formato SQL [$VER]	        "
echo "=========================================================="
echo "Format  : myim DB [SQL_FILENAME] [PATH]	                "
echo "----------------------------------------------------------"
echo "Example : myim mag_p20test mag_p20test.sql /sata/export	"
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
INPUT_DB=${1}
INPUT_FOLDER=${2}
INPUT_FILENAME=${3}

if [ "${INPUT_FOLDER}" == "" ] ; then
INPUT_FOLDER="/sata/dbs/"
fi

if [ "${INPUT_FILENAME}" == "" ] ; then
INPUT_FILENAME=$(ls -1  | grep "${INPUT_DB}" )
fi

OLD_PATH=${PWD}

cd ${INPUT_FOLDER}

USER="root"

#- Formato : 20151012.mag_d20test.sql

echo "CREATE DATABASE ${INPUT_DB}" | mysql -u root 2> /dev/null
create_OUT="$?"
if [ "${create_OUT}"  != "0" ]  ; then
echo "Error BD existe en el sistema. La borramos y la importamos"
mydr ${INPUT_DB}

myim ${INPUT_DB} ${INPUT_FOLDER} ${INPUT_FILENAME}

fi

cd ${OLD_PATH}

fi

}
