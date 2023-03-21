#!/bin/bash
#
# Script version 0.0.2
#
# Cambia permisos y propietario en arquitectura BRQX 

rmf()
{
VER="0.0.3"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Borra  ficheros de forma absoluta en la cadena de entrada en servidor [$VER]"
echo "=========================================================="
echo "Format  : mkp [FILES OR FOLDER LIST]						"
echo "----------------------------------------------------------"
echo "Example : mkp A B C										"
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

#Disable ls aliases
#Solo borra ficheros no directorios ni enlaces
for fich in "${@}" ; do
	rm -f ${fich}						2> /dev/null	 	
	rm_OUT=$?
	if [ "${rm_OUT}" != "0" ] ; then
		#-Second for for asc
		for fich2 in ${fich}  ; do
		rm -f ${fich2}					2> /dev/null	 	
		done
	fi
done


fi

}
