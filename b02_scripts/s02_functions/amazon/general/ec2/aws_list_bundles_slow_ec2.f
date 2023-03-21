#!/bin/bash
#
# Script version 0.0.3 - 13-08-2020
#
# Listado de instancias lightsail
# alias aw2lb
aws_list_bundles_slow_ec2()
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
#FreeTierEligible:_false
#InstanceType:_t3a.micro
#BareMetal:_false
#____MaximumIops:_40000 (Ebs)
#____Type:_ssd
#____SizeInGB:_1900
#__SizeInMiB:_499712  (mm)
#__NetworkPerformance:_25_Gigabit
#__DefaultCores:_32
#__DefaultVCpus:_64

# We add two filters
FILTER=$1
FILTER2=$2

# Get prices
#curl http://a0.awsstatic.com/pricing/1/ec2/linux-od.min.js | tr "]" "\n" | tr -d "}" | tr -d "{"
#Yaml file

if [ "${FILTER}" == "" ] ; then
FILTER=":"
FILTER2=":"
fi

ENABLE_INSTANCES="0"

# COMMAND="aws lightsail get-instances --output yaml | tr ' ' '_' |  grep _name | cut -c3-"

for line_instance in $(aws ec2 describe-instance-types --output yaml  | tr ' ' '_' |  egrep "BareMetal|NvmeSupport|Hypervisor|TotalSizeInGB|____Type|InstanceType|SizeInMiB|DefaultCores|DefaultVCpus|MaximumIops|NetworkPerformance|FreeTierEligible|AutoRecoverySupported" | cut -c 3-) ; do

#echo "${line_instance}"

selector=$(echo ${line_instance} | cut -d ":" -f1)
value=$(echo ${line_instance} | cut -d ":" -f2 | cut -c2-)
#-_AutoRecoverySupported:_true --> New instance 

#echo "$selector"

if [ "${ENABLE_INSTANCES}" == "1" ] ; then

case ${selector} in
"AutoRecoverySupported")

LINE="${instance_name}:${free_tier}:${iops}:${hdd_type}:${hdd_size}:"
LINE="${LINE}${memory}:${network}:${cpu_num}:${cpu_cores}:${baremetal}"
echo "${LINE}" ;;

"FreeTierEligible")
free_tier=$value ;;

"BareMetal")
  if [ "${value}" == "true " ] ; then
    baremetal="phisical"
  else
    baremetal="virtual"
  fi
  ;;
"____MaximumIops")
iops=$value ;;

"____Type")
hdd_type=$value ;;

"__TotalSizeInGB")
hdd_size=$value ;;

"__SizeInMiB")
memory=$value ;;

"__NetworkPerformance")
network=$value ;;

"__DefaultCores")
cpu_num=$value ;;

"__DefaultVCpus")
cpu_cores=$value ;;

"InstanceType")
instance_name=$value ;;

esac

fi

if   [ "${selector}" == "AutoRecoverySupported" ] ; then
ENABLE_INSTANCES="1"
fi

done  | sort | grep "${FILTER}" | grep "${FILTER2}"

# | sort | grep "${FILTER}"
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
