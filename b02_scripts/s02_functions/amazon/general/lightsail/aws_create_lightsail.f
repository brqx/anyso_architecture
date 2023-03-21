#!/bin/bash
#
# Script version 0.0.2 - 2020-08-17
#
# Create Instance
# alias awlc
aws_create_lightsail()
{
VER="0.0.2"
##"${1}" == "-?" -o


if [ "${1}" == "-?" -o "${1}" == ""  ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Generación y arranque de instancias lightsail pasadas por parametro "
echo "=========================================================="
echo "Format  : awlc | aws_create_lightsail [creacion instancias]"
echo "----------------------------------------------------------"
echo "----------------------------------------------------------"
echo "Example"
echo "----------------------------------------------------------"
echo "awlc r01 r02 r03  --> generate instances with defaul values"
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
# Para poder tener agilidad y crear N instancias vamos a considerar dos variables de entorno

FILTRO=$*

P E N D I E N T E
#-.--.--.--.--.--.- MANDATORY COMMANDS -.--.--.--.--.--.-

if [ "${AVAILABILITY}" == "" ] ; then
AVAILABILITY=us-east-2a
fi

if [ "${BLUEPRINT}" == "" ] ; then
BLUEPRINT=drupal
fi

if [ "${BUNDLE}" == "" ] ; then
BUNDLE=nano_2_0
fi

CMD="aws lightsail create-instances "
CMD="${CMD} --availability-zone ${AVAILABILITY} "
CMD="${CMD} --blueprint-id ${BLUEPRINT} "
CMD="${CMD} --bundle-id ${BUNDLE} "

#-.--.--.--.--.--.- OPTIONAL COMMANDS -.--.--.--.--.--.-


if [ "${KEYPAIR}" == "" ] ; then
KEYPAIR=public_pelonakeypair
fi

CMD="${CMD} --key-pair-name ${KEYPAIR} "


if [ "${USER_DATA}" != "" ] ; then
CMD="${CMD} --user-data ${USER_DATA} "
fi

if [ "${TAGS}" != "" ] ; then
CMD="${CMD} --tags ${TAGS} "
fi

# The file is in the folder we launch creation
#USER DATA example : file://profile_instance

#COMMAND="aws lightsail create-instances  \
#--instance-names  ${instance}            \
#--availability-zone ${AVAILABILITY}    \
#--blueprint-id ${BLUEPRINT}  \
#--bundle-id ${BUNDLE}        \
#--key-pair-name ${KEYPAIR}   \
#--user-data ${USER_DATA}"

COMM_CMD=${CMD}

for instance in "${FILTRO}" ; do

CMD="${COMM_CMD} --instance-names  ${instance} "

${CMD}
done

fi
}

