#!/bin/bash

#Reemplaza y luego sincroniza en otro server
#example myrpx unixy _p50 rct brqxrct.com unixy.es
myrpx()
{
#-El nombre de la bd es una concatenacion

PAR_01=${1}
PAR_02=${2}
PAR_03=${3}
PAR_04=${4}
PAR_05=${5}
PAR_06=${6}


#-Devuelve la cadena completa si lo es en el primer parametro
tratar_cadena_db ${PAR_01} ${PAR_02} ${PAR_03} ${PAR_04} ${PAR_05} ${PAR_06}

BD1=${BD}
BD2=${BD1}_tmp

echo "a01 - ${DB_SERVER_DESTINO}"
echo "mycp ${BD1} ${BD2}"
mycp ${BD1} ${BD2}

#-Tenemos efectos laterales
DB_SERVER_DESTINO_LOCAL=${DB_SERVER_DESTINO}

echo "a02 - ${DB_SERVER_DESTINO}"
echo "myrp ${BD2} ${SEARCH} ${REPLACE}"
myrp ${BD2} ${SEARCH} ${REPLACE}

DB_SERVER_DESTINO=${DB_SERVER_DESTINO_LOCAL}

echo "a03 - ${DB_SERVER_DESTINO}"
echo "db_sync_tmp ${BD1} ${DB_SERVER_DESTINO}"
# Esto esta pendiente
#mysx_tmp ${BD1} ${DB_SERVER_DESTINO}

#mydr ${BD2}
}