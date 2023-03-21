#!/bin/bash
#
# Script version 0.0.4
#
#- Cluster File Operations - Link files 
#  Use cop (Cluster OPeration Command )
cln()
{
VER="0.0.4"

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Realiza un link en arquitectura de cluster [$VER]"
echo "=========================================================="
echo "Format  : cln SITE_ID                                    "
echo "----------------------------------------------------------"
echo "Example : cln light                                      "
echo "Example : cln mainwar                                    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

SOURCE="${1}"
TARGET="${2}"
FIRST_LETTER=$( echo "${SOURCE}" | cut -c1 )
FOLDER_SRC=$(dirname ${SOURCE})

if [ "${TARGET}" != "" ] ; then
	FOLDER_TAR=$(dirname ${TARGET})
	FIRST_LETTER_TAR=$( echo "${TARGET}" | cut -c1 )
	if [ "${FIRST_LETTER_TAR}" != "/"  ] ; then
	#- Is a new folder with relative path
	TARGET="${PWD}/${TARGET}"
	cmk_OUT="CH"
	cmk_MSG="Cambio de ruta ajustando path absoluto ${SOURCE}"
	else
	echo "Target absoluta"
	fi
fi

if [ "${FIRST_LETTER}" != "/"  ] ; then
#- Is a new folder with relative path
SOURCE="${PWD}/${SOURCE}"
cmk_OUT="CH"
cmk_MSG="Cambio de ruta ajustando path absoluto ${SOURCE}"
else
echo "Source absoluta"
fi


OLD_PWD=${PWD}

if 		[ "${TARGET}" == "" 		] ; then
#-Primer caso link sin target
COMMAND="cd ${PWD}  && unlink ${SOURCE} && ln -sf ${SOURCE} && cd ${OLD_PWD} 	"
else
#-Segundo caso con target
COMMAND="cd ${PWD}  && unlink ${TARGET} && ln -sf ${SOURCE} ${TARGET} && cd ${OLD_PWD} 	"
fi

echo "cop ${COMMAND}"

cch
fi
}
