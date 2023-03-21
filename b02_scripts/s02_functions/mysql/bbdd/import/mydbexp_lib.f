#!/bin/bash
#
# Script version 0.0.2
#
#Exporta por completo una BD mysql en una ruta indicada
#example mydbex path
myalldbex()
{
VER="0.0.2"
#-El nombre de la bd es una concatenacion
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Exporta por completo la BD en formato SQL [$VER]	        "
echo "=========================================================="
echo "Format  : mydbex PATH                                     "
echo "----------------------------------------------------------"
echo "Example : mydbex /sata/mysql/export                       "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
OUTPUT_FOLDER=${1}

if [ "${OUTPUT_FOLDER}" == "" ] ; then
OUTPUT_FOLDER="/sata/dbs/"
fi

if [ "${USER}" == "" ] ; then
USER="root"
fi


# Cadenas de busqueda y reemplazo

echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Exporta por completo la BD en formato SQL [$VER]	        "
echo "----------------------------------------------------------"
echo "Ruta Destino : ${OUTPUT}									"
echo "=========================================================="

#rm "$OUTPUTDIR/*gz" > /dev/null 2>&1

#databases=$(mysql -u $USER --batch --skip-column-names -e "SHOW DATABASES;" | grep -E -v "(information|performance)_schema")
exception_list="information|performance|cphulk|eximstat|leechprotect|mysql|whmxfer|modsec|roundcube|rcube"

databases=$(mysql -u root --batch --skip-column-names -e "SHOW DATABASES;" \
| grep -E -v "(${exception_list})")


OUTOUT="CLEAN"
for db in $databases; do
echo "Exportando : $db ${OUTPUT_FOLDER}"
myex ${db} ${OUTPUT_FOLDER}
done

OUTOUT=""

fi

}
