#!/bin/bash
#
# Script version 0.0.3 - 13-08-2020
#
# Listado de instancias lightsail
# alias awlbund
aws_list_bundles_lightsail()
{
VER="0.0.3"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Listado de bundles disponibles en lightsail [$VER]					"
echo "=========================================================="
echo "Format  : awlbund | aws_list_bundles_lightsail [Filter]              "
echo "----------------------------------------------------------"
echo "Example                                                   "
echo "----------------------------------------------------------"
echo "rctlig_04:drupal:nano_2_0:us-east-2:us-east-2a:stopped    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
# Nos basamos en el formato devuelto por aws:
# __availabilityZone:_us-east-2a
# __regionName:_us-east-2
# blueprintId:_drupal
# bundleId:_nano_2_0
# name:_rctlig_04
# __name:_stopped

FILTER=$1

if [ "${FILTER}" == "" ] ; then
FILTER="@"
fi

# COMMAND="aws lightsail get-instances --output yaml | tr ' ' '_' |  grep _name | cut -c3-"

aws lightsail get-bundles --output text | grep 'BUNDLES'  | grep -v win| tr '\t' '@' | cut -d '@' -f2,3,4,8,9,10- | grep "${FILTER}"

fi
}


aws_list_bundles_lightsail_tab()
{
VER="0.0.3"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Listado de bundles disponibles en lightsail con salida tabulada [$VER]"
echo "=========================================================="
echo "Format  : awlbund | aws_list_bundles_lightsail [Filter]              "
echo "----------------------------------------------------------"
echo "Example                                                   "
echo "----------------------------------------------------------"
echo "rctlig_04:drupal:nano_2_0:us-east-2:us-east-2a:stopped    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

aws_list_bundles_lightsail "$*"  |  tr ":" "\t"

fi
}
