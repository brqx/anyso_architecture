#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.8" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#-------------------------------------------------------------------
#-- ckahdr
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Cabeceras multi puerto para comprobacion puertos en dominio
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T check domain ports
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [DOMAIN]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E ckahdr brqx.es 	-- Comprueba puertos contra el dominio 
#-------------------------------------------------------------------
#+ Funciones frecuentes de llamada : 
#-------------------------------------------------------------------
#F shell
#-------------------------------------------------------------------
ckahdr()
{
VER="0.0.8"
FUNC="ckahdr"

ckahdr_NFO="Cabeceras multi puerto para comprobacion puertos en dominio [$VER]"
ckahdr_FMT="ckahdr [DOMAIN]"
ckahdr_EXA="ckahdr pbrqx.com"

ckahdr_OUT=0
ckahdr_ERR=""
ckahdr_HDR=""					# HEADERS
ckahdr_VAL=""					# VALUES


#-El nombre de la bd es una concatenacion


if [ "${1}" == "-?" ] ; then

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wcur_NFO}" "${wcur_FMT}" "${wcur_EXA}"
#--------------------------------------------------------------------------------

else


ckahdr_OUT=""

#                      1	2	3 	4 	5	6 	7 	8 	9 	 10  11  12  13  14  15  16  17
prtyline_set_args_len 20    10  10  10  10  10  10  10  #10  10  10  10  10  10  10  10  10

h1="DOMAIN / PORTS"
h2="[22]"				;h3="[60022]"		;h4="[64000]"				# Shell ports
h5="[80]"				;h6="[60080]"		;h7="[60081]"				
h8="[60082]"			;h9="[60083]"		;h10="[60084]"				# Web Ports
h11="[60091]"			;h12="[8080]"					

h13="[110]"				;h14="[25]"		;	
h15="[60110]"			;h16="[60025]"		
h17="[3306]"					

prtyline_set_line "$h1" "$h2"  "$h3"  "$h4"  "$h5"  "$h6"  "$h7"  "$h8"  "$h9"        
ckahdr_HDR_01="${prtyline_set_line_OUT}"

prtyline_set_line "   " "$h10" "$h11" "$h12" "$h13" "$h14" "$h15" "$h16" "$h17"   
ckahdr_HDR_02="${prtyline_set_line_OUT}"

#Vamos a devolver dos cadenas - Una de cabeceras y otra de valores. Ambas con separador ##

ckahdr_HDR="${ckahdr_HDR_01}##${ckahdr_HDR_02}" 

fi

}
