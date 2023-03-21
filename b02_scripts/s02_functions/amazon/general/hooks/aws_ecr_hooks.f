#!/bin/bash
#---------------------------------------------------------------------------------
#
# Script version 0.0.2 -- 2021 - November
# Farmacia Zaragoza - Brqx Architectures
#
# AWS Hooks for functions
#
# __check_aws_region_account
#
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Manage TMP files for Aws commands
__check_aws_region_account()
{
if [ "${ACCOUNT_ID_passed}" != "" ] ; then
aws_account_id_inner=${ACCOUNT_ID_passed}
else
aws_account_id_inner=${aws_account_id}
fi

# Manage Hook Region

if [ "${REGION_passed}" != "" ] ; then
aws_region_inner=${REGION_passed}
else
aws_region_inner=${aws_region}
fi

if [ "${aws_region_inner}" == "" ] ; then
# Ponemos una region por defecto
aws_region_inner="eu-west-1"
fi
}

#---------------------------------------------------------------

__check_aws_ecr()
{
#Imagen ECR
if [ "${ECR_IMAGE_passed}" != "" ] ; then
image_tag_inner=${ECR_IMAGE_passed}
else
image_tag_inner=${image_tag}
fi

#Repositorio ECR
if [ "${ECR_REPO_passed}" != "" ] ; then
repository_name_inner=${ECR_REPO_passed}
else
repository_name_inner=${repository_name}
fi

}

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

