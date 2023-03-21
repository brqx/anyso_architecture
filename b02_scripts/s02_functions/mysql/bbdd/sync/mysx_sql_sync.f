#!/bin/bash

#Sincroniza una BD de un servidor a otro

# Format  : mysx CADENA_DB | ( ENTORNO VARIANTE PROYECTO ) SERVER_REMOTE
# Example : mysx meto _p51 meto bbrqx.com
# Example : mysx meto_p51meto bbrqx.com

mysx()
{

local_outgoing=/root/scripts/out
remote_outgoing=/root/scripts/in

PAR_01=${1}
PAR_02=${2}
PAR_03=${3}
PAR_04=${4}
PAR_05=${5}
PAR_06=${6}

tratar_cadena_db ${PAR_01} ${PAR_02} ${PAR_03} ${PAR_04} ${PAR_05} ${PAR_06}


echo "Transferencia : ${BD} ${DB_SERVER_DESTINO} "

NUM_DBS=$(mylist ${BD} | wc -l )

if [ "${NUM_DBS}" != "0" ] ; then

echo "xfer_mysql_db ${BD} ${BD} ${DB_SERVER_DESTINO}"
xfer_mysql_db ${BD} ${BD} ${DB_SERVER_DESTINO};

#fix_remote_db ${DB_SERVER_DESTINO} ${ENTORNO_LOCAL} d50${PROYECTO_LOCAL} ;

else

echo "No existe la BD ${BD}"

fi

}

mysxany()
{

local_outgoing="/root/scripts/out"
remote_outgoing="/root/scripts/in"

BD=${1}
DB_SERVER_DESTINO=${2}

echo "Transferencia : ${BD} ${DB_SERVER_DESTINO} "

NUM_DBS=$(mylistall | grep ${BD} | wc -l )

if [ "${NUM_DBS}" != "0" ] ; then

echo "xfer_mysql_db ${BD} ${BD} ${DB_SERVER_DESTINO}"
xfer_mysql_db ${BD} ${BD} ${DB_SERVER_DESTINO}

#fix_remote_db ${DB_SERVER_DESTINO} ${ENTORNO_LOCAL} d50${PROYECTO_LOCAL} ;

else

echo "No existe la BD ${BD}"

fi

}

