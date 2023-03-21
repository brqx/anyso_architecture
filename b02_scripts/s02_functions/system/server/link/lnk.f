#!/bin/bash
#
# Script version 0.0.2
#
#Sincroniza la ruta que se le indique en el servidor indicado
#Bidireccional
#example mydbex path

lnk()
{
VER="0.0.2"
#-El nombre de la bd es una concatenacion

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Genera enlaces en ficheros y directorios [$VER]			"
echo "=========================================================="
echo "Format  : lnk SRC TARGET	                             	"
echo "----------------------------------------------------------"
echo "Example : lnk my_esport /sata/mysql/export              	"
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

SOURCE="${1}"		# - Destino que deberia existir
TARGET="${2}"		# - Link que se crea
FIRST_LETTER_SRC=$( echo "${SOURCE}" | cut -c1 	)
FIRST_LETTER_TAR=$( echo "${TARGET}" | cut -c1 	)
DIRNAME_SRC=$(dirname "${SOURCE}")
DIRNAME_TAR=$(dirname "${TARGET}")
BASENAME_SRC=$(basename "${SOURCE}")
BASENAME_TAR=$(basename "${TARGET}")

FOLDER_SRC=$(dirname ${SOURCE}				)

#NOTA: PERMITIMOS LINKS AUNQUE NO EXISTA EL DISTINO. SE PUEDE CREAR MAS TARDE

#-PRIMER CASO - UN SOLO PARAMETRO SRC EMPTY
if [ "${TARGET}" == "" ] ; then
	#ln -sf /home/palillos
##	echo "Caso Uno"
	
	if [ -L ${SOURCE} ] ; then
	unlink ${SOURCE}
	fi
	
	ln -sf ${SOURCE}

else
#-SEGUNDO CASO - UN SOLO PARAMETRO SRC CONTINE OTRA RUTA
# A: ln -sf /home/palillos  palillitos
# B: ln -sf /home/palillos  /home/palillitos
	if [ -L ${TARGET} ] ; then
	unlink ${TARGET}
	fi


	if [ "${FIRST_LETTER_TAR}" == "/"  ] ; then
		#-Es una ruta
##		echo "Caso Dos-B : ${BASENAME_TAR}"

		if [ -d ${DIRNAME_TAR} ] ; then	
		OLD_PWD=$PWD
		cd ${DIRNAME_TAR}
##		echo "ln -sf ${SOURCE} ${BASENAME_TAR}"	
		ln -sf ${SOURCE} ${BASENAME_TAR}
		cd ${OLD_PWD}	
		OLD_PWD=
		fi
	
	else
		#-No es una ruta
		echo "Caso Dos-A"
		
		ln -sf ${SOURCE} ${TARGET}
	fi
fi

fi

}
