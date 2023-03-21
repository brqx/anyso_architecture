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

OUTOUT="CLEANX"

SOURCE=${1}
TARGET=${2}
FOLDER_SRC=$(dirname ${SOURCE})

POSIBLE_TARGET="${PWD}/$(basename ${SOURCE} )"
OLD_PWD=${PWD}

if 		[ "${TARGET}" != "" 		] ; then
COMMAND="cd ${PWD}  && unlink ${TARGET} && ln -sf ${SOURCE} ${TARGET} && cd ${OLD_PWD} 	"
elif 	[ -L "${POSIBLE_TARGET}"  	] ; then
COMMAND="cd ${PWD}  && unlink ${POSIBLE_TARGET} && ln -sf ${SOURCE} && cd ${OLD_PWD} 	"
else
COMMAND="cd ${PWD}  && ln -sf ${SOURCE} && cd ${OLD_PWD}"
fi

cop "${COMMAND}"

cch
fi
}
