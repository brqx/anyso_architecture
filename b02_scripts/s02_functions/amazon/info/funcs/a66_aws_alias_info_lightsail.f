#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

# Alias awzl
aws_alias_info_lightsail()
{
VER="0.0.0.1"
FEC="2022-Jul"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informacion de los alias definidos en Amazon LightSail en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : awzl | aws_alias_info_lightsail               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

echo "--==--==--==--==--==--==--==--==--==--==--"
echo "Alias definidos Amazon LightSail en arquitectura Brqx ${VER} - ${FEC} - Nivel 0"
echo "------------------------------------------"

set_text_length 40



#---------------- C O N N E C T ------------------

#alias awssh="aws_ssh"
TEXT="$(alias awssh)"
echo "$(format_text_length ${TEXT})  - ${yellow}Conexion SSH a lightsail"$(textreset)

#---------------- L I G H T S A I L ------------------

#alias awl="aws lightsail "
TEXT="$(alias awl)"
echo "$(format_text_length ${TEXT})  - ${yellow}Principal alias de LightSail"$(textreset)

#---------------- G E T   K E Y S ------------------

#-Get Key pairs
#alias awlk="awl get-key-pairs --output text | tr '\t' ' ' | cut -d ' '  -f5"
TEXT="$(alias awlk)"
echo "$(format_text_length ${TEXT})  - ${yellow}Get Key pairs"$(textreset)

#---------------- L I S T   ------------------

#alias awll="aws_list_lightsail"
TEXT="$(alias awll)"
echo "$(format_text_length ${TEXT})  - ${yellow}Lista las instancias lightsail"$(textreset)

#---------------- B L U E   P R I N T S  ------------------

#-Get Blue Prints (ubuntu, drupal ...)
#alias awlblue="awl get-blueprints --output text | tr '\t' ' ' | cut -d ' ' -f 2"
TEXT="$(alias awlblue)"
echo "$(format_text_length ${TEXT})  - ${yellow}Lista las imagenes principales (bluerpints) (drupal ... )"$(textreset)

#---------------- B U N D L E S  ------------------

# Get Bundles (nano ... cpu ... disk .... price  ... memory)
#alias awlbund="aws_list_bundles_lightsail_tab "
TEXT="$(alias awlbund)"
echo "$(format_text_length ${TEXT})  - ${yellow}Lista los tipos de instancia LightSail"$(textreset)

#---------------- G E T   I P ------------------

#Get IP of instance
#alias awlip="aws_getip_lightsail "
TEXT="$(alias awlip)"
echo "$(format_text_length ${TEXT})  - ${yellow}Retorna la IP de LightSail"$(textreset)

#---------------- C R E A T E  ------------------

#alias awlc="aws_create_lightsail "
TEXT="$(alias awlc)"
echo "$(format_text_length ${TEXT})  - ${yellow}Crea una nueva instancia LightSail"$(textreset)

#---------------- S T O P ------------------

#alias awlp="aws_stop_lightsail "
TEXT="$(alias awlp)"
echo "$(format_text_length ${TEXT})  - ${yellow}Detiene una instancia lightsail"$(textreset)

#---------------- S T A R T  ------------------

#alias awls="aws_start_lightsail "
TEXT="$(alias awls)"
echo "$(format_text_length ${TEXT})  - ${yellow}Inicia una instancia detenida LightSail"$(textreset)

#---------------- D E L E T E  ------------------

#Delete and delete force
#alias awld="aws_delete_lightsail "
TEXT="$(alias awld)"
echo "$(format_text_length ${TEXT})  - ${yellow}Elimina una instancia LightSail"$(textreset)

#---------------- D E L E T E    F O R C E ------------------

#alias awldd="aws_deleteforce_lightsail "
TEXT="$(alias awldd)"
echo "$(format_text_length ${TEXT})  - ${yellow}Elimina una instancia de LightSail aunque este arrancada"$(textreset)

#---------------- D E L   F O R C E   AND   W A I T ------------------

#alias awlddw="aws_deleteforce_and_wait_lightsail "
TEXT="$(alias awlddw)"
echo "$(format_text_length ${TEXT})  - ${yellow}Solicita la eliminacion de la instancia"$(textreset)

#---------------- R E S T A R T   ------------------

#alias awlr="awl restart-instance "
TEXT="$(alias awlr)"
echo "$(format_text_length ${TEXT})  - ${yellow}Reinicia una instancia LightSail"$(textreset)

#---------------- G E T   I N S T A N C E S  ------------------

#alias awlg="awl get-instances "
TEXT="$(alias awlg)"
echo "$(format_text_length ${TEXT})  - ${yellow}Obtiene informacion sobre las instancia lanzadas"$(textreset)

#---------------- k 8 S  ------------------

#alias awlk8="aws_create_k8s_lightsail "
TEXT="$(alias awlk8)"
echo "$(format_text_length ${TEXT})  - ${yellow}Genera infraestructura K8s con instancias LightSail"$(textreset)

#---------------- P L A N  ------------------


echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

