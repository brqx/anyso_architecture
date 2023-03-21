#!/bin/bash
#
# Script version 0.0.3
#
#Exporta por completo una BD mysql en una ruta indicada
#example mydbex path
myex()
{
VER="0.0.3"
#-El nombre de la bd es una concatenacion
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Exporta una BD en formato SQL [$VER]						"
echo "=========================================================="
echo "Format  : mydbex PATH                                     "
echo "----------------------------------------------------------"
echo "Example : mydbex /sata/mysql/export                       "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
OUTPUT_DB=${1}
OUTPUT_FOLDER=${2}
OUTPUT_FILENAME=${3}


if [ "${OUTPUT_FOLDER}" == "" ] ; then
OUTPUT_FOLDER="/sata/dbs/"
fi

if [ "${OUTPUT_FILENAME}" == "" ] ; then
OUTPUT_FILENAME="$(date +%Y%m%d).${OUTPUT_DB}.sql"
fi


if [ "${USER}" == "" ] ; then
USER="root"
fi

FULL_NAME=${OUTPUT_FOLDER}${OUTPUT_FILENAME}


# Cadenas de busqueda y reemplazo
if [ "${OUTOUT}" != "CLEAN" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Exporta por completo la BD en formato SQL [$VER]	        "
echo "--------------------------------------------------------------------"
echo "Ruta Destino  : ${OUTPUT_FOLDER}									"
echo "Database      :  ${OUTPUT_DB}											    "
echo "========================================="
fi

#rm "$OUTPUTDIR/*gz" > /dev/null 2>&1
OLD_PATH=${PWD}

cd ${OUTPUT_FOLDER}
#-No podemos hacerlo asi pues guarda la ruta en el tar
OUTFILE="${OUTPUT_DB}_$(date +%Y%m%d).sql"
mysqldump -u $USER --databases ${OUTPUT_DB} > ${OUTFILE} 2> /dev/null
dump_OUT=$?
if [ "${dump_OUT}" == "0" ] ; then
tar zcpvf ${OUTFILE}.tar.gz ${OUTFILE} 2> /dev/null
tar_OUT=$?
if [ "${tar_OUT}" == "0" ] ; then
rm -f ${OUTFILE}
fi

fi

cd ${OLD_PATH}

fi
}
