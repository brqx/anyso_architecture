#!/bin/bash
#
# Script version 0.0.2
#
#Cuenta las BBDD formato MyIsam que existen en el servidor
#example myisam
myisam()
{
VER="0.0.2"
#-Listado estado cluster
##"${1}" == "-?" -o

TYPE="${1}"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Cuenta las BBDD formato MyIsam que existen en el servidor "
echo "=========================================================="
echo "Format  : myisam [list]                                   "
echo "----------------------------------------------------------"
echo "Example : myisam                                          "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
elif [ "${1}" == "list" ] ;then

STR="select concat('alter table ',table_schema,'.',table_name,' engine=InnoDB;') "
STR="${STR} from information_schema.tables where table_schema not in "
STR="${STR} ('mysql','information_schema','performance_schema') and engine!='InnoDB';"

echo "----------------------------------------------------------------------"
echo "Se muestra sentencia para convertir BBDD existentes en ${HOSTNAME}    "
echo "--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--"
mysql mysql -sss -e "${STR}"  2> /dev/null | wc -l
echo "----------------------------------------------------------------------"



else

# Bytes recibidos To check gcache
STR="select concat('alter table ',table_schema,'.',table_name,' engine=InnoDB;') "
STR="${STR} from information_schema.tables where table_schema not in "
STR="${STR} ('mysql','information_schema','performance_schema') and engine!='InnoDB';"

NUM_MYISAM=$( mysql mysql -sss -e "${STR}"  2> /dev/null | wc -l )

echo "----------------------------------------------------------------------"

if [ "${NUM_MYISAM}" == "0" ] ; then
echo "Contando las BBDD MyIsam que existen en el sistema : ${HOSTNAME}      "
echo "--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--"
echo "${NUM_MYISAM}" 
else
echo "Se muestra sentencia para convertir BBDD existentes en ${HOSTNAME}    "
echo "--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--"
mysql mysql -sss -e "${STR}"  2> /dev/null 
fi
echo "----------------------------------------------------------------------"

fi
}
