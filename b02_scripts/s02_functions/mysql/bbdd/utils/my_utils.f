#!/bin/bash

#Sincroniza una BD de un servidor a otro
#example dbreplace unixy _p50 rct brqxrct.com unixy.es

crear_cadena_db()
{
ENTORNO=${1};
VARIANTE=${2};
PROYECTO=${3};

BD="${entorno}${variante}${proyecto}" ;
RETFN=$BD ;
}

#- Ejemplo : tratar_cadena_db rct_p50cards miscards.com cards.abrqx.com kbrqx.com
tratar_cadena_db()
{
PAR_01=${1}
PAR_02=${2}
PAR_03=${3}
PAR_04=${4}
PAR_05=${5}
PAR_06=${6}


echo "${1}" | grep "_" &> /dev/null
esBDCompleta=$?

if [ "${esBDCompleta}" == "0" ] ; then
	BD="${PAR_01}"
	ENTORNO=$( echo ${BD} | cut -d "_" -f1 )
	VARIANTE=$( echo ${BD} | cut -d "_" -f2 | cut -c1-3 )
	PROYECTO=$( echo ${BD} | cut -d "_" -f2- | cut -c4- )
	SEARCH=${PAR_02}
	REPLACE=${PAR_03}
	DB_SERVER_DESTINO=${PAR_04}
	#-Si no hay busqueda y reemplazo el servidor sera el parametro anterior
	if [ "${DB_SERVER_DESTINO}" == "" ] ; then
	   DB_SERVER_DESTINO=${PAR_02}
	fi
else
	ENTORNO=${PAR_01}
	VARIANTE=${PAR_02}
	PROYECTO=${PAR_03}
	SEARCH=${PAR_04}
	REPLACE=${PAR_05}
	DB_SERVER_DESTINO=${PAR_06}
	if [ "${DB_SERVER_DESTINO}" == "" ] ; then
	   DB_SERVER_DESTINO=${PAR_04}
	fi

fi

echo "${VARIANTE}" | grep "_" &> /dev/null
tieneGUION=$?

if [ "${tieneGUION}" == "1" ] ; then
VARIANTE=_${VARIANTE}
fi


#-Debemos reajusar la cadena de BD
BD=${ENTORNO}${VARIANTE}${PROYECTO}
RETFN=$BD
}


