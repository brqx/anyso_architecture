#!/bin/bash
#
# Script version 0.0.2 - 13-08-2020
#
# Listado de instancias lightsail
# alias awll
aws_list_lightsail()
{
VER="0.0.2"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Listado de  instancias lightsail [$VER]					"
echo "=========================================================="
echo "Format  : awll | aws_list_lightsail                       "
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


# COMMAND="aws lightsail get-instances --output yaml | tr ' ' '_' |  grep _name | cut -c3-"

for line_instance in $(aws lightsail get-instances --output yaml | tr ' ' '_' |  egrep "_name|region|availability|bundle|blueprint" | cut -c3-) ; do
#echo "${line_instance}"

selector=$(echo ${line_instance} | cut -d ":" -f1)
value=$(echo ${line_instance} | cut -d ":" -f2 | cut -c2-)

if   [ "${selector}" == "__name" ] ; then
echo "${instance_name}:${blueprint_name}:${bundle_name}:${region_name}:${zone_name}:${value}"
elif [ "${selector}" == "__availabilityZone" ] ; then
zone_name=$value
elif [ "${selector}" == "__regionName" ] ; then
region_name=$value
elif [ "${selector}" == "bundleId" ] ; then
bundle_name=$value
elif [ "${selector}" == "blueprintId" ] ; then
blueprint_name=$value

elif [ "${selector}" == "name" ] ; then
instance_name=$value
fi

done

fi
}

