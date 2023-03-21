#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

# Alias awszt
aws_alias_info_cf()
{
VER="0.0.0.1"
FEC="2022-Jul"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informacion de los alias definidos en Amazon Cloud Formation en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : awzcf | aws_alias_info_cf               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

echo "--==--==--==--==--==--==--==--==--==--==--"
echo "Alias definidos Amazon Cloud Formation [CF] en arquitectura Brqx ${VER} - ${FEC} - Nivel 0"
echo "------------------------------------------"

set_text_length 40



#---------------- C LO U D   F O R M A T I O N ------------------

#Amazon Cloud Formation

#alias awf="aws cloudformation "
TEXT="$(alias awf)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias principal Amazon Cloud Formation"$(textreset)


#---------------- C R E A T E    S T A C K  ------------------

# Funcionalidad Create Stack Cloud Formation

#alias awfc="aws_create_cf"
TEXT="$(alias awfc)"
echo "$(format_text_length ${TEXT})  - ${yellow}Crea una pila Cloud Formation"$(textreset)

#---------------- D E L E T E     S T A C K  ------------------

# Funcionalidad Delete Stack Cloud Formation

#alias awfd="aws_delete_cf"
TEXT="$(alias awfd)"
echo "$(format_text_length ${TEXT})  - ${yellow}Elimina una pila Cloud Formation"$(textreset)

#---------------- L I S T    S T A C K S  ------------------

# Funcionalidad List Stack Cloud Formation

#alias awfl="aws_list_cf"
TEXT="$(alias awfl)"
echo "$(format_text_length ${TEXT})  - ${yellow}Lista las pilas Cloud Formation en ejecucion"$(textreset)



echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

