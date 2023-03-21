#!/bin/bash
#
# Script version 0.0.3 - 13-08-2020
#
# Listado de instancias lightsail
# alias aw2lb
aws_list_prices_slow_ec2()
{
VER="0.0.3"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Listado de tipos de instancias y precios Ec2 [$VER]					"
echo "=========================================================="
echo "Format  : aw2lb | aws_list_prices_ec2 [Filter]              "
echo "----------------------------------------------------------"
echo "Example                                                   "
echo "----------------------------------------------------------"
echo "rctlig_04:drupal:nano_2_0:us-east-2:us-east-2a:stopped    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
# Nos basamos en el formato devuelto por aws:

#clockSpeed:_3_GHz
#dedicatedEbsThroughput:_Up_to_2250_Mbps
#instanceType:_c5d.xlarge
#memory:_8_GiB
#networkPerformance:_Up_to_10_Gigabit
#operatingSystem:_Windows
#physicalProcessor:_Intel_Xeon_Platinum_8124M
#storage:_1_x_100_NVMe_SSD
#vcpu:_

# We add two filters
FILTER=$1
FILTER2=$2

# Get prices 2019
#curl http://a0.awsstatic.com/pricing/1/ec2/linux-od.min.js | tr "]" "\n" | tr -d "}" | tr -d "{"
# Get prices 2020 (latest)
# https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonEC2/current/index.json
# https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonEC2/current/index.csv

# cat ${PRICES_FILE} | \
# egrep "storage|instanceType|vcpu|clockSpeed|networkPerformance|FreeTierEligible|tributes|memory|storage|operatingSystem|phisicalProcessor|dedicatedEbsThroughput|__USD" | \
# grep -v Attributes  | grep -v "_storage" > fast_prices.yaml

#cat index.csv | grep Oregon | wc -l
#111912
#cat index.csv | grep Oregon | grep Linux | wc -l
#57815
#cat index.csv | grep Oregon | grep Linux | grep OnDemand | wc -l
#6436

# aw2p > fast_result.dat
# cat fast_result.dat | grep -v Windows | sort -u > fast_result2.dat 



#PRICES_FILE='./prices.yaml'
PRICES_FILE='./fast_prices.yaml'

PRICES_FILE_CSV='./prices_oregon.fast'
#0.0047000000,t3a.nano,2,AMD EPYC 7571,2.5 GHz,0.5 GiB,EBS only,Up to 5 Gigabit,Up to 2085 Mbps,0.25


if [ "${FILTER}" == "" ] ; then
FILTER=":"
FILTER2=":"
fi

ENABLE_INSTANCES="0"

# COMMAND="aws lightsail get-instances --output yaml | tr ' ' '_' |  grep _name | cut -c3-"

for line_instance in $(cat ${PRICES_FILE} )  ; do

#echo "${line_instance}"

selector=$(echo ${line_instance} | cut -d ":" -f1)
value=$(echo ${line_instance} | cut -d ":" -f2 | cut -c2-)
#-_AutoRecoverySupported:_true --> New instance 

#echo "$selector"

if [ "${ENABLE_INSTANCES}" == "1" ] ; then

if   [ "${selector}" == "tributes" ] ; then
price=$(cat ${PRICES_FILE_CSV} | grep ${instance_name} | head -1 | cut -d "," -f1 | cut -c1-8 )

LINE="${instance_name}:${free_tier}:${price}:${clock}:${hdd_size}:"
LINE="${LINE}${memory}:${network}:${cpu_num}:${os_type}:${processor}:${throughput}"
echo "${LINE}"

elif [ "${selector}" == "FreeTierEligible" ] ; then
free_tier=$value
elif [ "${selector}" == "operatingSystem" ] ; then
os_type=$value
elif [ "${selector}" == "physicalProcessor" ] ; then
processor=$value
elif [ "${selector}" == "clockSpeed" ] ; then
clock=$value
elif [ "${selector}" == "dedicatedEbsThroughput" ] ; then
throughput=$value
elif [ "${selector}" == "storage" ] ; then
hdd_size=$value
elif [ "${selector}" == "memory" ] ; then
memory=$value
elif [ "${selector}" == "networkPerformance" ] ; then
network=$value
elif [ "${selector}" == "vcpu" ] ; then
cpu_num=$value
elif [ "${selector}" == "instanceType" ] ; then
instance_name=$value
fi

fi

if   [ "${selector}" == "tributes" ] ; then
ENABLE_INSTANCES="1"
fi

done  

# | sort | grep "${FILTER}"
# | sort | grep "${FILTER}" | grep "${FILTER2}"
fi
}

aws_list_prices_ec2_tab()
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

aws_list_prices_ec2 "$*"  |  tr ":" "\t"

fi
}
