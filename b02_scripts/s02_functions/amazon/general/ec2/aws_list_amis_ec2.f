#!/bin/bash
#
# Script version 0.0.3 - 28-08-2020
#
# Listado de instancias lightsail
# alias aw2amis - aw2a
aws_list_amis_ec2()
{
VER="0.0.3"
DATE="28-08-2020"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Listado de amis (imagenes) Ec2 [$VER]	- ${DATE}		    "
echo "=========================================================="
echo "Format  : aw2a | aws_list_amis_ec2 [Filters]              "
echo "----------------------------------------------------------"
echo "Example                                                   "
echo "----------------------------------------------------------"
echo "aw2amis -n a EKS Ubuntu 2020                              "
echo "----------------------------------------------------------"
echo "Output                                                    "
echo "----------------------------------------------------------"
echo "2020-07-30:ubuntu-eks/k8s_1.16/images/hvm-ssd/ubuntu-bio:0af78fffee347b9cf:None:Canonical,_Ubuntu_EKS_Node_OS_(k8s_1.16),_18.    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
# Nos basamos en el formato devuelto por aws:
# Como aws es lento vamos a generar un fichero para usar que se podrá actualizar con la fucion slow
# 
# aws_list_bundles_slow ec2 > fichero

# aw2a bitnami | wc -l
# 12979
# aw2a | wc -l
# 53376

# aw2a -d EKS Ubuntu 2020 | sort -r
# 2020-07-30:ubuntu-eks/k8s_1.16/images/hvm-ssd/ubuntu-bio:0af78fffee347b9cf:None:Canonical,_Ubuntu_EKS_Node_OS_(k8s_1.16),_18.
# 2020-07-30:ubuntu-eks/k8s_1.15/images/hvm-ssd/ubuntu-bio:0a29cbf81825b8e0b:None:Canonical,_Ubuntu_EKS_Node_OS_(k8s_1.15),_18.
# 2020-07-20:ubuntu-eks/k8s_1.16/images/hvm-ssd/ubuntu-bio:08be75154e7c1ec41:None:Canonical,_Ubuntu_EKS_Node_OS_(k8s_1.16),_18.
# 2020-04-07:ubuntu-eks/k8s_1.15/images/hvm-ssd/ubuntu-bio:08371c3df6115af43:None:Canonical,_Ubuntu_EKS_Node_OS_(k8s_1.15),_18.
# 2020-03-19:ubuntu-eks/k8s_1.15/images/hvm-ssd/ubuntu-bio:0af0245499387d758:None:Canonical,_Ubuntu_EKS_Node_OS_(k8s_1.15),_18.
# 2020-01-22:ubuntu-eks/k8s_1.14/images/hvm-ssd/ubuntu-bio:0c4c60006aa81c29b:None:Canonical,_Ubuntu_EKS_Node_OS_(k8s_1.14),_18.
# 2020-01-22:ubuntu-eks/k8s_1.13/images/hvm-ssd/ubuntu-bio:09b1e0371464f4d02:None:Canonical,_Ubuntu_EKS_Node_OS_(k8s_1.13),_18.
# 2020-01-22:ubuntu-eks/k8s_1.12/images/hvm-ssd/ubuntu-bio:0d1e326f80cb5cb10:None:Canonical,_Ubuntu_EKS_Node_OS_(k8s_1.12),_18.

# echo "Llega ahora :  $*"

if [ "${DATS}" == "" ] ; then
DATS="./dats/"
fi

AMIS_FAST_FILE="${DATS}fast_result_amis.dat"

FILTER=$1
FILTER2=$2
FILTER3=$3

OPT="ami"
AMIS=""

# Get prices
#curl http://a0.awsstatic.com/pricing/1/ec2/linux-od.min.js | tr "]" "\n" | tr -d "}" | tr -d "{"
#Yaml file

case ${FILTER} in
"-n")
# will be sorted by name
OPT="name"
FILTER=${FILTER2}
FILTER2=${FILTER3} 
FILTER3=$4  ;;
"-d")
# will be sorted by name
OPT="date"
FILTER=${FILTER2} 
FILTER2=${FILTER3}
FILTER3=$4;;
"-a")
FILTER=${FILTER2} 
FILTER2=${FILTER3}
FILTER3=$4
AMIS="ami-"
;;
esac


if     [ "${FILTER}"  == ""  ] ; then
FILTER=":"
FILTER2=":"
elif   [ "${FILTER}"  == "a" ] ; then
AMIS="ami-"
fi

if     [ "${FILTER2}" == ""  ] ; then
FILTER2=":"
elif   [ "${FILTER2}" == "a" ] ; then
AMIS="ami-"
fi

if     [ "${FILTER3}" == ""  ] ; then
FILTER3=":"
fi


#aw2 describe-images --owners amazon --filters 'Name=name,Values=amzn2-ami-hvm-2.0.????????-x86_64-gp2' 'Name=state,Values=available' --output json \
#| jq -r '.Images | sort_by(.CreationDate) | last(.[]).ImageId'


#ID - Name - Date - Owner - Description
for line_instance in $(cat ${AMIS_FAST_FILE} | grep "${FILTER}" | grep "${FILTER2}" | grep "${FILTER3}" ) ; do

ID=$(  echo ${line_instance} | cut -d ":" -f1  )
NAME=$(echo ${line_instance} | cut -d ":" -f2  )
DATE=$(echo ${line_instance} | cut -d ":" -f3  )
OWNE=$(echo ${line_instance} | cut -d ":" -f4  )
DESC=$(echo ${line_instance} | cut -d ":" -f5  )

#ID OK
#LINE="${ID}:${NAME}:${DESC}"
LINE2=${line_instance}

case $OPT in
"ami")
LINE="${AMIS}${ID}:${NAME}:${DATE}:${OWNE}:${DESC}" ;;
"name")
LINE="${NAME}:${AMIS}${ID}:${DATE}:${OWNE}:${DESC}" ;;
"date")
LINE="${DATE}:${NAME}:${AMIS}${ID}:${OWNE}:${DESC}" ;;
esac

echo ${LINE}

done

fi
}

#-------------------------------------------------------------------------------------------

# alias aw2amis -  aw2a
aws_list_amis_ec2_tab()
{

VER="0.0.3"
DATE="28-08-2020"


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Listado de amis (imagenes) Ec2 con salida tabulada [$VER] - ${DATE} "
echo "=========================================================="
echo "Format  : aw2amis | aws_list_amis_ec2_tab [Filter]       "
echo "----------------------------------------------------------"
echo "Example                                                   "
echo "----------------------------------------------------------"
echo "aw2amis -n a EKS Ubuntu 2020                              "
echo "----------------------------------------------------------"
echo "Output                                                    "
echo "----------------------------------------------------------"
echo "2020-07-30:ubuntu-eks/k8s_1.16/images/hvm-ssd/ubuntu-bio:0af78fffee347b9cf:None:Canonical,_Ubuntu_EKS_Node_OS_(k8s_1.16),_18.    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Con $* falla
#echo "Se pasa : $@ "
aws_list_amis_ec2 "$@"  |  tr ":" "\t"

fi
}
