#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Farmacia Zaragoza - Brqx Architectures - Rct - 2021
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
#
# Parametros Comunes para Aws
# -------------------------------------------------------------------

# Aws Set Global parameters - Tmp Files

__tmp_file

# Aws Set Global parameters - Variables

__regions

DEFAULT_VPC=$(  aws ec2 describe-vpcs --output text | grep True| tr "\t" " "| cut -d " " -f8 )

VPCS=$(                        aws ec2 describe-vpcs | grep VpcId | tr -s " " | cut -d " " -f3 | tr "\n" " ")

aws ec2 describe-subnets --filters Name=vpc-id,Values=${DEFAULT_VPC} --output text  > ${TMP_FILE}

SUBNETS=$(                cat ${TMP_FILE} | tr "\t" " " | cut -d " " -f13| tr "\n" " " | tr -s " " )

PUBLIC_SUBNETS=$( cat ${TMP_FILE} | tr "\t" " " | cut -d " " -f9,13| grep True | cut -d " " -f2 | tr "\n" " " | tr -s " " )

# Delete Temporally Files
rm -f ${TMP_FILE} 

export REGIONS CURRENT_REGION VPCS DEFAULT_VPC SUBNETS PUBLIC_SUBNETS