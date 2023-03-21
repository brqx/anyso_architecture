#!/bin/bash

#-Sincroniza desde una bd temporal que luego se borrara
mysx_tmp()
{

local_outgoing=/root/scripts/out
remote_outgoing=/root/scripts/in

PAR_01=${1}
PAR_02=${2}
PAR_03=${3}
PAR_04=${4}
PAR_05=${5}

tratar_cadena_db ${PAR_01} ${PAR_02} ${PAR_03} ${PAR_04} ${PAR_05}

echo "Transferencia : ${BD} ${DB_SERVER_DESTINO} "

#Hay que ver si existe la BD

NUM_DBS=$(mylist ${BD}_tmp | wc -l )

if [ "${NUM_DBS}" == "1" ] ; then

echo "xfer_mysql_db ${BD}_tmp ${BD} ${DB_SERVER_DESTINO}"
xfer_mysql_db ${BD}_tmp ${BD} ${DB_SERVER_DESTINO}
#fix_remote_db ${DB_SERVER_DESTINO} ${ENTORNO_LOCAL} d50${PROYECTO_LOCAL} ;

else

echo "No existe la BD ${BD}_tmp"

fi

}