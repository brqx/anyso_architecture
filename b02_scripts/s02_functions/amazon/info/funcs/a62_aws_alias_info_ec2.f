#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

# Alias awz2
aws_alias_info_ec2()
{
VER="0.0.0.1"
FEC="2022-Jul"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informacion de los alias definidos en Amazon EC2 en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : awz2 | aws_alias_info_ec2               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

echo "--==--==--==--==--==--==--==--==--==--==--"
echo "Alias definidos Amazon ec2 en arquitectura Brqx ${VER} - ${FEC} - Nivel 0"
echo "------------------------------------------"

set_text_length 40


#---------------- M A I N   E C 2  ------------------

#Amazon EC2

#alias aw2="aws ec2 "
TEXT="$(alias aw2)"
echo "$(format_text_length ${TEXT})  - ${yellow}Pricipal alias de EC2"$(textreset)

#---------------- C O N E C T  ------------------

# Funcionalidad Connect Instance [SSH to INSTANCE] ( 18-11-2021) 
#alias aw2s="aws_connect_ec2"
TEXT="$(alias aw2s)"
echo "$(format_text_length ${TEXT})  - ${yellow}Conexion a una instancia"$(textreset)

#--------- S E C U R I T Y   G R O U P S   ------------------

#alias awsgi="aw2 describe-security-groups --query 'SecurityGroups[*].GroupId' --output text | tr '\t' '\n'"
#alias awsgn="aw2 describe-security-groups --query 'SecurityGroups[*].[GroupId, GroupName ,Vpc]' --output table | tr '\t' '\n'"
TEXT="$(alias ti)"
echo "$(format_text_length ${TEXT})  - ${yellow}Informa sobre los Security Groups"$(textreset)

#---------------- C R E A T E   ------------------

#- Pendiente de crear funcion - Version alfa 
alias aw2c="aws_create_ec2"
TEXT="$(alias aw2c)"
echo "$(format_text_length ${TEXT})  - ${yellow}Crea una nueva instancia"$(textreset)


#------------- T E R M I N A T E   ------------------

alias aw2t="aws_terminate_ec2"
#alias aw2d="aws_delete_ec2"
TEXT="$(alias aw2t)"
echo "$(format_text_length ${TEXT})  - ${yellow}Termina una instancia"$(textreset)

#---------------- I N F O   ------------------

#- Pendiente de crear funcion - describe - info
alias aw2i="aws_info_ec2"
TEXT="$(alias aw2l)"
echo "$(format_text_length ${TEXT})  - ${yellow}Informacion sobre una instancia"$(textreset)


#- Pendiente de crear funcion
#alias aw2l="aws_list_ec2"
TEXT="$(alias aw2l)"
echo "$(format_text_length ${TEXT})  - ${yellow}Lista las instancias lanzadas"$(textreset)

#---------------- R U N   ------------------

#alias aw2r="aws ec2 run-instances "
TEXT="$(alias aw2r)"
echo "$(format_text_length ${TEXT})  - ${yellow}Inicia las instancias indicadas"$(textreset)

#---------------- S T A R T   ------------------

#alias aw2sta="aws_start_ec2"
TEXT="$(alias aw2sta)"
echo "$(format_text_length ${TEXT})  - ${yellow}Inicia la instancia EC2"$(textreset)

#---------------- S T O P   ------------------

#alias aw2sto="aws_stop_ec2"
TEXT="$(alias aw2sto)"
echo "$(format_text_length ${TEXT})  - ${yellow}Detiene la instancia EC2"$(textreset)

#---------------- B U N D L E S  ------------------

# Habilitamos salida tabulada - ec2 instance list
alias aw2bund="aws_list_bundles_ec2_tab "
TEXT="$(alias aw2bund)"
echo "$(format_text_length ${TEXT})  - ${yellow}Habilitamos salida tabulada - ec2 instance list"$(textreset)

# Habilitamos salida no tabulada - ec2 instance list
#alias aw2bunn="aws_list_bundles_ec2 "
TEXT="$(alias aw2bunn)"
echo "$(format_text_length ${TEXT})  - ${yellow}Habilitamos salida no tabulada - ec2 instance list"$(textreset)

#---------------- P R I C E S  ------------------

# Listado de precios de instancias EC2
#alias aw2p="aws_list_prices_ec2 "
TEXT="$(alias aw2p)"
echo "$(format_text_length ${TEXT})  - ${yellow}Listado de precios de instancias EC2"$(textreset)

#---------------- A M I  ------------------

# Habilitamos salida tabulada - ec2 images|ami list
#alias aw2a="aws_list_amis_ec2_tab "
TEXT="$(alias aw2a)"
echo "$(format_text_length ${TEXT})  - ${yellow}Habilitamos salida tabulada - ec2 images|ami list"$(textreset)

#alias aw2amis="aws_list_amis_ec2"
TEXT="$(alias aw2amis)"
echo "$(format_text_length ${TEXT})  - ${yellow}IHabilitamos salida no tabulada - ec2 images|ami list"$(textreset)

#alias aw2aslow="aws_list_amis_slow_ec2 "
TEXT="$(alias aw2aslow)"
echo "$(format_text_length ${TEXT})  - ${yellow}ec2 images|ami list"$(textreset)

#Show Ami/Image full information
#alias aw2i="aws_show_ami_ec2 "
TEXT="$(alias aw2i)"
echo "$(format_text_length ${TEXT})  - ${yellow}Show Ami/Image full information"$(textreset)

#---------------- E I P   ------------------

# Elastic ips
# alias aw2lips="aws_list_eips "
TEXT="$(alias aw2lips)"
echo "$(format_text_length ${TEXT})  - ${yellow}Lista las IPs Elasticas de Amazon Aws"$(textreset)



echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

