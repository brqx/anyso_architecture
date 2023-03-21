#!/bin/bash
#
# Script version 0.0.1
#
# Tag ECR IMAGE
# 


# Tag ECR IMAGE
aws_ecr_push()
{
VER="0.0.1"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "  Subida del TAG generado al repositorio de Amazon ECR [$VER]	"
echo "=========================================================="
echo "Format  : awep | aws_ecr_push [ECR_IMAGE] [ECR_REPO] [ACCOUNT_ID] [REGION] "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Tiene dos modos de funcionamiento
# 1. Pasando los parametros AccountID y/o Region
#
# 2. Usando las variables aws_account_id y aws_region

ECR_IMAGE_passed=$1
ECR_REPO_passed=$2
ACCOUNT_ID_passed=$3
REGION_passed=$4

__check_aws_region_account

__check_aws_ecr
 
if [ "${repository_name_inner}" != "" -a  "${image_tag_inner}" != "" ] ; then

if [ "${aws_account_id_inner}" != "" -a  "${aws_region_inner}" != "" ] ; then

#----====----====----====----====----====----====----====----====
#           I N I C I O    D E   L A    L O G I C A 
#----====----====----====----====----====----====----====----====

echo "------------------------------------------------------"
echo "  Subida de la IMAGEN para subir a ECR "
echo "--==--==--==--==--==--==--==--==--==--==--==--==--==--"
# 
# IMAGE --> Imagen generada que queremos taggear
#
# image_tag --> Nombre de Imagen en el repositorio ECR
#

docker push ${aws_account_id_inner}.dkr.ecr.${aws_region_inner}.amazonaws.com/${repository_name_inner}:${image_tag_inner}

echo "------------------------------------------------------"


#----====----====----====----====----====----====----====----====
#              F I N    D E   L A    L O G I C A 
#----====----====----====----====----====----====----====----====

fi

fi

fi

}
