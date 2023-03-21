#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.8" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#-------------------------------------------------------------------
#-- ckallout
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Comprueba puertos en el dominio indicado
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
#E ckallout brqx.es 	-- Comprueba puertos contra el dominio 
#-------------------------------------------------------------------
#+ Funciones frecuentes de llamada : 
#-------------------------------------------------------------------
#F shell
#-------------------------------------------------------------------
ckallout()
{
VER="0.0.8"
FUNC="ckallout"

ckallout_NFO="Comprobacion puertos dominio [$VER]"
ckallout_FMT="ckallout [DOMAIN]"
ckallout_EXA="ckallout pbrqx.com"

ckallout_OUT=0
ckallout_ERR=""
ckallout_MSG=""

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMUN
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
header_common "${ckallout_NFO}"
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--

#-El nombre de la bd es una concatenacion


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " " ] ; then

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE ESPECIFICA
#--------------------------------------------------------------------------------
header_specific "${ckallout_FMT}" "${ckallout_EXA}"
#--------------------------------------------------------------------------------

else

SERVER=$1

if [ "${SERVER}" == "" ] ; then
SERVER=hbrqx.com
fi


PERL_CK="/root/scripts/arq/libs/perl/cport.pl"

valport[0]='@'
valport[1]="_"

ckall_OUT=""

for port in 22 25 80 110 3306 8080 9983 11983  60022 60025 60080 60081 60082 60083 60084 60086  60091 60110 64000 ; do

#-Si da un 0 esta abierto - 1 esta cerrado - si es aix es distinta
perl_OUT=$( ${PERL_CK} ${SERVER} ${port} | grep Closed | wc -l)

w[${port}]=" ${valport[${perl_OUT}]} "

done


#                      1	2	3 	4 	5	6 	7 	8 	9 	 10  11  12  13  14  15  16  17
prtyline_set_args_len 20    10  10  10  10  10  10  10  #10  10  10  10  10  10  10  10  10

p1=${SERVER}

p2="[${w[22]}]"			;p3="[${w[60022]}]"		;p4="[${w[64000]}]"		# Ssh ports
p5="[${w[80]}]"			;p6="[${w[60080]}]"		;p7="[${w[60081]}]"
p8="[${w[60082]}]"		;p9="[${w[60083]}]"		;p10="[${w[60084]}]"	# Web ports
p11="[${w[60091]}]"		;p12="[${w[8080]}]"	

p13="[${w[110]}]"		;p14="[${w[25]}]"								# Mail Ports	
p15="[${w[60110]}]"		;p16="[${w[60025]}]"	
p17="[${w[3306]}]"														# Sql Ports

prtyline_set_line "$p1" "$p2" "$p3"  "$p4"  "$p5"  "$p6"  "$p7"  "$p8"  "$p9"   
servers_OUT_01="${prtyline_set_line_OUT}"

prtyline_set_line "  "  "$p9" "$p10" "$p11" "$p12" "$p13" "$p14" "$p15" "$p16"   
servers_OUT_02="${prtyline_set_line_OUT}"


h1="DOMAIN / PORTS"
h2="[22]"				;h3="[60022]"		;h4="[64000]"				# Shell ports
h5="[80]"				;h6="[60080]"		;h7="[60081]"				
h8="[60082]"			;h9="[60083]"		;h10="[60084]"				# Web Ports
h11="[60091]"			;h12="[8080]"					

h13="[110]"				;h14="[25]"		;	
h15="[60110]"			;h16="[60025]"		
h17="[3306]"					

prtyline_set_line "$h1" "$h2"  "$h3"  "$h4"  "$h5"  "$h6"  "$h7"  "$h8"  "$h9"        
ckallout_HDR_01="${prtyline_set_line_OUT}"

prtyline_set_line "   " "$h10" "$h11" "$h12" "$h13" "$h14" "$h15" "$h16" "$h17"   
ckallout_HDR_02="${prtyline_set_line_OUT}"


##ckall_HDR="SERV/PRTS - [SH ] [SHP] [SE ] - [W0 ] [W1 ] [W2 ] [W3 ] [W4 ] [V ] [GX ] - [MY ] - [POP] [SMT]"

header_free "${ckallout_HDR_01}" "${servers_OUT_01}" 

header_free "${ckallout_HDR_02}" "${servers_OUT_02}" 


fi

}
