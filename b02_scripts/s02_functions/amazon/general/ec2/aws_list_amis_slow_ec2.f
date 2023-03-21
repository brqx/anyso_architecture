#!/bin/bash
#
# Script version 0.0.3 - 28-08-2020
#
# Listado de imagenes/amis para EC2
# alias aw2amis aw2img
aws_list_amis_slow_ec2()
{
VER="0.0.3"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Genera Listado de amis (imagenes) Ec2 [$VER]				"
echo "=========================================================="
echo "Format  : aw2aslow | aws_list_amis_slow_ec2               "
echo "----------------------------------------------------------"
echo "Example                                                   "
echo "----------------------------------------------------------"
echo "001be37fea967f717:bitnami-neo4j-4.1.1-0-r03-linux-debian-10-x86_64-hvm-ebs-nam:2020-08-13:None:This_image_may_not_be"
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
# Nos basamos en el formato devuelto por aws:
# Como aws es lento vamos a generar un fichero para usar que se podrá actualizar con la fucion slow
# 
# aws_list_amis_slow_ec2     > dats/ami_list.dat

#time aws_list_amis_slow_ec2 > ./dats/fast_result_amis_new.dat 
# real	14m40,033s
# user	2m35,400s
# sys	19m17,903s

#aw2 describe-images --owners amazon --filters 'Name=name,Values=amzn2-ami-hvm-2.0.????????-x86_64-gp2' 'Name=state,Values=available' --output json \
#| jq -r '.Images | sort_by(.CreationDate) | last(.[]).ImageId'

# jq - Command-line JSON processor

#ID - Name - Date - Owner - Description
for line_instance in $(aw2 describe-images --query "Images[*].{aId:ImageId,bN:Name,cDate:CreationDate,dOwn:ImageOwnerAlias,eDes:Description}" --filters "Name=architecture,Values=x86_64" "Name=state,Values=available" "Name=platform-details,Values=Linux/UNIX" --output text | tr "\t" "@"  | tr " " "_" ) ; do

ID=$(  echo ${line_instance} | cut -d "@" -f1  | cut -d "-" -f2 )
NAME=$(echo ${line_instance} | cut -d "@" -f2  | cut -c1-60 )
DATE=$(echo ${line_instance} | cut -d "@" -f3  | cut -c1-10 )
OWNE=$(echo ${line_instance} | cut -d "@" -f4  | cut -c1-7 )
DESC=$(echo ${line_instance} | cut -d "@" -f5- | cut -c1-150 )

#ID OK
#LINE="${ID}:${NAME}:${DESC}"
LINE="${ID}:${NAME}:${DATE}:${OWNE}:${DESC}" 
echo ${LINE}

done

fi
}

#-------------------------------------------------------------------------------------------

aws_show_ami_ec2()
{
VER="0.0.3"

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Muestra en detalle la imagen pasada como parametro (imagenes) Ec2 [$VER]					"
echo "=========================================================="
echo "Format  : aw2i | aws_show_amis_ec2 [ID]              "
echo "----------------------------------------------------------"
echo "Example                                                   "
echo "----------------------------------------------------------"
echo "- Architecture: x86_64                                    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
#Muestra la informacion en formato yaml de la imagen pasada como parametro

IMAGE=$1

FILTER="Name=image-id,Values=${IMAGE}"

aws ec2 describe-images --filters ${FILTER} --output yaml

fi
}
