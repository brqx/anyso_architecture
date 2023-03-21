#!/bin/bash
#---------------------------------------------------------------- 
#- Funciones de manipulacin SQL
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
#- mycp - mycr - mydr - mymv - mycptmp
#---------------------------------------------------------------- 

mylist()
{
VER="0.0.1"


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Listado de Bases de Datos	[$VER]							"
echo "=========================================================="
echo "Format  : mylist	[FILTRO_DB]								"
echo "----------------------------------------------------------"
echo "Example : mylist was_p50was --> Lista la BD de was		"
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
else

DB_FILTER=$1
DB_FILTER_02=$2
DB_FILTER_02=$3


if  [ "${DB_FILTER}" == "" ] ; then
#-No mostramos ninguna informacion para controla si no existe alguna BD

mysql -u root -e "show databases;"	\
| grep -v "Database"				\
| grep -v "information_schema"		\
| grep -v "mysql"					\
| grep -v "performance_schema"          \
| grep "_" | cut -d " " -f1

elif [ "${DB_FILTER_02}" == "" ] ; then

mysql -u root -e "show databases;"	\
| grep -v "Database"				\
| grep -v "information_schema"		\
| grep -v "mysql"					\
| grep    "${DB_FILTER}"			\
| cut -d " " -f1

elif [ "${DB_FILTER_03}" == "" ] ; then

mysql -u root -e "show databases;"  \
| grep -v "Database"                \
| grep -v "information_schema"      \
| grep -v "mysql"                   \
| grep    "${DB_FILTER}"            \
| grep    "${DB_FILTER_02}"         \
| cut -d " " -f1

else

mysql -u root -e "show databases;"  \
| grep -v "Database"                \
| grep -v "information_schema"      \
| grep -v "mysql"                   \
| grep    "${DB_FILTER}"            \
| grep    "${DB_FILTER_02}"         \
| grep    "${DB_FILTER_03}"         \
| cut -d " " -f1
  
fi

fi

}

mycleanall()
{
VER="0.0.1"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Listado de Bases de Datos	[$VER]							"
echo "=========================================================="
echo "Format  : mylistall	[FILTRO_DB]							"
echo "----------------------------------------------------------"
echo "Example : mylistall--> Lista Todas las BBDD               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
else 
#-No mostramos ninguna informacion para controla si no existe alguna BD

for i in $(mysql -u root -e "show databases;"	\
| grep -v "Database"				\
| grep -v "information_schema"      \
| grep -v "performance_schema"      \
| grep -v "mysql"                   \
| cut -d " " -f1 ) ; do
  echo $i ;
  echo "truncate $i.watchdog" | mysql ; 

done  

fi
}
