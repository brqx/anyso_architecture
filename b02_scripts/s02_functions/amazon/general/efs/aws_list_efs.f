#!/bin/bash
#
# Script version 0.0.3
#
# Listado de EFSs de AWS
# alias awlefs


#Lista los Targets de los EFS indicando los grupos de seguridad con su nombre
__aws_list_efs_targets()
{

MTIDS=$(cat ${TMP_FILE_TARGET} | grep "MountTargetId:"        | tr "\t" " " | tr -s " " | cut -d " " -f3 | tr "\n" " ")
MTAZS=$(cat ${TMP_FILE_TARGET} | grep "AvailabilityZoneName:" | tr "\t" " " | tr -s " " | cut -d " " -f3 | tr "\n" " ")
MTSNS=$(cat ${TMP_FILE_TARGET} | grep "SubnetId:"             | tr "\t" " " | tr -s " " | cut -d " " -f3 | tr "\n" " ")
MTVPC=$(cat ${TMP_FILE_TARGET} | grep "VpcId:"                | tr "\t" " " | tr -s " " | cut -d " " -f3 | tr "\n" " ")

c1=1
for mtid in ${MTIDS} ; do

mtid=$( echo ${MTIDS} | cut -d " " -f${c1}  )
mtaz=$( echo ${MTAZS} | cut -d " " -f${c1}  )
mtsn=$( echo ${MTSNS} | cut -d " " -f${c1}  )
mtvp=$( echo ${MTVPC} | cut -d " " -f${c1}  )


mtsg=$(aws efs describe-mount-target-security-groups --mount-target-id ${mtid} | grep sg | cut -d " " -f2 )

aws ec2 describe-security-groups --group-id ${mtsg} --output yaml > ${TMP_FILE}_inner

mtsg_name=$(cat ${TMP_FILE}_inner | grep "GroupName:"   | tr -s " " | cut -d " " -f3 )

#Si no se pasa o la vpc es la que se pasa los mostramos
if [ "${VPCID}" == "" -o "${mtvp}" == "${VPCID}" ] ; then
echo "${mtid} : ${mtaz}  : ${mtsn} : ${mtvp} : ${mtsg} - ${mtsg_name}"
fi

let c1++

done

rm -f ${TMP_FILE}_inner
}

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--

#List EFS Filesystems
aws_list_efs()
{
VER="0.0.1"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Listado de EFS [$VER]	    			             		"
echo "=========================================================="
echo "Format  : awlefs | aws_list_efs [VPC]                     "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

#Casos de funcionamiento 

# 1- No se pasa nada --> Saca todos los EFS de la region actual asociados con cualquier VPC

# 2- Se pasa la VPC  --> Muestra información de los EFS y luego los targets de la VPC actual

# Mostrar las VPCs de la region actual

TMP_FILE="/tmp/output_command_brqx"


# Review defined VPC
__set_current_vpc $*

aws efs describe-file-systems  --output yaml > ${TMP_FILE}

echo "Name : ID  : NumberOfMountTargets"
echo "-----------------------------------------------------"

NAMES=$( cat ${TMP_FILE}  | grep "Name:"         | tr "\t" " " | tr -s " " | cut -d " " -f3 | tr "\n" " ")
IDS=$(   cat ${TMP_FILE}  | grep "FileSystemId:" | tr "\t" " " | tr -s " " | cut -d " " -f3 | tr "\n" " ")
NUMS=$(  cat ${TMP_FILE}  | grep "NumberOfMountTargets:" | tr "\t" " " | tr -s " " | cut -d " " -f3 | tr "\n" " ")

c=1
for name in ${NAMES} ; do
id=$(       echo ${IDS}  | cut -d " " -f${c}  )
ntargets=$( echo ${NUMS} | cut -d " " -f${c}  )

aws efs describe-mount-targets --file-system-id ${id} > ${TMP_FILE}_${name}


echo "${name} : ${id}  : ${ntargets} "

## --file-system-id <value>

let c++

done

# Primero sacamos los sistemas de ficheros y luego los montajes
echo "-----------------------------------------------------"
echo "=-.-==-.-==-.-==-.-==-.-==-.-==-.-==-.-==-.-==-.-==-."
echo "-----------------------------------------------------"

echo "MountID : AZ  : SubnetId : VPC - SecurityGroup"
echo "-----------------------------------------------------"

for name in ${NAMES} ; do

echo "${name} --> MountID : AZ  : SubnetId : VPC - SecurityGroup"
echo "-----------------------------------------------------"


TMP_FILE_TARGET="${TMP_FILE}_${name}"

 __aws_list_efs_targets

rm -f ${TMP_FILE_TARGET}

done

echo "-----------------------------------------------------"

fi
}
