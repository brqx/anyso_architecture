#!/bin/bash
#---------------------------------------------------------------- 
#- Funciones de manipulacin SQL
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
#- mycp - mycr - mydr - mymv - mycptmp
#---------------------------------------------------------------- 

mylnum()
{
VER="0.0.1"
DB_FILTER=$1

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Listado de Bases de Datos	[$VER]							"
echo "=========================================================="
echo "Format  : mylnum	[FILTRO_DB]								"
echo "----------------------------------------------------------"
echo "Example : mylnum was_p50was --> Lista BB con el numero de tablas"
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
elif [ "${DB_FILTER}" == "" ] ; then
#-No mostramos ninguna informacion para controla si no existe alguna BD

LIST_DB=$(mysql -u root -e "show databases;"	\
| grep -v "Database"				\
| grep -v "information_schema"		\
| grep -v "mysql"					\
| grep -v "performance_schema"          \
| grep "_" | cut -d " " -f1 | tr "\n" " " )

else

LIST_DB=$(mysql -u root -e "show databases;"	\
| grep -v "Database"				\
| grep -v "information_schema"		\
| grep -v "performance_schema"      \
| grep -v "mysql"					\
| grep    "${DB_FILTER}"			\
| cut -d " " -f1 | tr "\n" " " ) 

fi

for base in ${LIST_DB} ; do
NUM_TABLAS=$( mysql -u root -e  "show tables from ${base}" | grep -v "\-\-" | grep -v "Tables_in" | wc -l )
echo "${base} [${NUM_TABLAS}]"
done
}
