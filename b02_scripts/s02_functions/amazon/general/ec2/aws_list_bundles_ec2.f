#!/bin/bash
#
# Script version 0.0.3 - 13-08-2020
#
# Listado de instancias lightsail
# alias aw2lb
aws_list_bundles_ec2()
{
VER="0.0.3"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Listado de tipos de instancias Ec2 [$VER]					"
echo "=========================================================="
echo "Format  : aw2lb | aws_list_bundles_ec2 [Filter]              "
echo "----------------------------------------------------------"
echo "Example                                                   "
echo "----------------------------------------------------------"
echo "rctlig_04:drupal:nano_2_0:us-east-2:us-east-2a:stopped    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
# Nos basamos en el formato devuelto por aws:
# Como aws es lento vamos a generar un fichero para usar que se podrá actualizar con la fucion slow
# 
# aws_list_bundles_slow ec2 > fichero

if  "${DATS}" == "" ; then
DATS="./dats/"
fi

BUNDLES_FAST_FILE="${DATS}fast_result_bundles.dat"
PRICES_FAST_FILE="${DATS}fast_result_prices.dat"

FILTER=$1
FILTER2=$2

# Get prices
#curl http://a0.awsstatic.com/pricing/1/ec2/linux-od.min.js | tr "]" "\n" | tr -d "}" | tr -d "{"
#Yaml file

if [ "${FILTER}" == "" ] ; then
FILTER=":"
FILTER2=":"
fi

for line_instance in $(cat ${BUNDLES_FAST_FILE} | grep "${FILTER}" | grep "${FILTER2}" ) ; do
# t3.micro:false:11800:ssd:1900:1024:Up_to_5_Gigabit:1:2:virtual

instance_name=$(echo ${line_instance} | cut -d ":" -f1 )
free_tier=$(echo ${line_instance} | cut -d ":" -f2 )
iops=$(echo ${line_instance} | cut -d ":" -f3 )
hdd_type=$(echo ${line_instance} | cut -d ":" -f4 )
hdd_size=$(echo ${line_instance} | cut -d ":" -f5 )
memory=$(echo ${line_instance} | cut -d ":" -f6 )
network=$(echo ${line_instance} | cut -d ":" -f7 )
cpu_num=$(echo ${line_instance} | cut -d ":" -f8 )
cpu_cores=$(echo ${line_instance} | cut -d ":" -f9 )
baremetal=$(echo ${line_instance} | cut -d ":" -f10 )

price_line=$(cat ${PRICES_FAST_FILE} | grep  ${instance_name} )

price=$(echo ${price_line} | cut -d ":" -f2 )

LINE="${instance_name}:${price}:${free_tier}:${iops}:${hdd_type}:${hdd_size}:"
LINE="${LINE}${memory}:${network}:${cpu_num}:${cpu_cores}:${baremetal}"
echo "${LINE}"

done

fi
}

aws_list_bundles_ec2_tab()
{
if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Listado de tipos de instancias Ec2 con salida tabulada[$VER]"
echo "=========================================================="
echo "Format  : aw2lb | aws_list_bundles_ec2_tab [Filter]       "
echo "----------------------------------------------------------"
echo "Example                                                   "
echo "----------------------------------------------------------"
echo "rctlig_04:drupal:nano_2_0:us-east-2:us-east-2a:stopped    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

aws_list_bundles_ec2 "$*"  |  tr ":" "\t"

fi
}
