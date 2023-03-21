#!/bin/bash
#
# Script version 0.0.1
#
# Tag ECR IMAGE
# 


# Tag ECR IMAGE

#---------------------------------------------------------------

aws_ecr_tag_latest()
{
VER="0.0.2"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "  TAG de imagen <latest> en repositorio Amazon ECR [$VER]	"
echo "=========================================================="
echo "Format  : awet | aws_ecr_tag_latest [IMAGE] [ECR_IMAGE] [ECR_REPO] [ACCOUNT_ID] [REGION]    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Tiene dos modos de funcionamiento
# 1. Pasando los parametros AccountID y/o Region
#
# 2. Usando las variables aws_account_id y aws_region

IMAGE_passed=$1
ECR_IMAGE_passed=$2
ECR_REPO_passed=$3
ACCOUNT_ID_passed=$4
REGION_passed=$5

# Hook Aws Region ( aws_region - aws_account_id)
__check_aws_region_account


# Hook Imagen generada 
__image

# Hook Ecr ( image_tag - repository_name)

__check_aws_ecr

if [ "${repository_name_inner}" != "" -a  "${image_tag_inner}" != "" -a  "${IMAGE_innner}" != "" ] ; then

if [ "${aws_account_id_inner}" != "" -a  "${aws_region_inner}" != "" ] ; then
#----====----====----====----====----====----====----====----====
#           I N I C I O    D E   L A    L O G I C A 
#----====----====----====----====----====----====----====----====

echo "------------------------------------------------------"
echo "  Taggeo de la IMAGEN para subir a ECR "
echo "--==--==--==--==--==--==--==--==--==--==--==--==--==--"
# 
# IMAGE --> Imagen generada que queremos taggear
#
# image_tag --> Nombre de Imagen en el repositorio ECR
#

docker tag ${IMAGE_innner}:latest ${aws_account_id_inner}.dkr.ecr.${aws_region_inner}.amazonaws.com/${repository_name_inner}:${image_tag_inner}

echo "Tagged: ${aws_account_id_inner}.dkr.ecr.${aws_region_inner}.amazonaws.com/${repository_name_inner}:${image_tag_inner}"

echo "------------------------------------------------------"

#----====----====----====----====----====----====----====----====
#              F I N    D E   L A    L O G I C A 
#----====----====----====----====----====----====----====----====
else
__aws_ecr_tag_latest_manage_imput_params
fi

else
__aws_ecr_tag_latest_manage_imput_params
fi

fi
 
}

#---------------------------------------------------------------

__aws_ecr_tag_latest_manage_imput_params()
{
echo "Faltan Parametros"
echo "------------------------------------------------------"
echo "Docker IMAGE : -${IMAGE_innner}-"
echo "Aws Account  : -${aws_account_id_inner}-"
echo "Region       : -${region_inner}-"
echo "Repositorio  : -${repository_name_inner}-"
echo "Imagen ECR   : -${image_tag_inner}-"
echo "------------------------------------------------------"
}
