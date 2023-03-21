#!/bin/bash
#
# Script version 0.0.2 - 2020-08-17
#
# Create Instance
# alias awlk8
aws_create_k8s_lightsail()
{
VER="0.0.2"
##"${1}" == "-?" -o


if [ "${1}" == "-?" -o "${1}" == ""  ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Generación y arranque de cluster k8s con instancias lightsail "
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

instance=$1

#-.--.--.--.--.--.- MANDATORY COMMANDS -.--.--.--.--.--.-

if [ "${AVAILABILITY}" == "" ] ; then
AVAILABILITY=us-east-2a
fi

if [ "${BLUEPRINT}" == "" ] ; then
BLUEPRINT=ubuntu_16_04_2
fi

if [ "${BUNDLE}" == "" ] ; then
BUNDLE=micro_2_0
fi

CMD="aws lightsail create-instances "
CMD="${CMD} --availability-zone ${AVAILABILITY} "
CMD="${CMD} --blueprint-id ${BLUEPRINT} "
CMD="${CMD} --bundle-id ${BUNDLE} "

#-.--.--.--.--.--.- OPTIONAL COMMANDS -.--.--.--.--.--.-

# To create we use the public keypair
if [ "${KEYPAIRCREATE}" == "" ] ; then
KEYPAIRCREATE=public_pelonakeypair
fi

CMD="${CMD} --key-pair-name ${KEYPAIRCREATE} "

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

for number in `seq 1 3` ; do

CMD="${COMM_CMD} --instance-names  ${instance}-${number} "

${CMD} --user-data "$(cat ./install-prereqs.sh)" &> /dev/null 
done

fi
}

