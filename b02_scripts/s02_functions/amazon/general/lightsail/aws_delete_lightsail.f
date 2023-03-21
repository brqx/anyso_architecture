#!/bin/bash
#
# Script version 0.0.2 - 13-08-2020
#
# Borrado de instancias normal. La borra aunque esté corriendo
# alias awll
aws_delete_lightsail()
{
VER="0.0.2"
##"${1}" == "-?" -o

if [ "${1}" == "-?" -o "${1}" == ""  ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Borrado de instancias lightsail (Solo las borra si estan paradas) [$VER]					"
echo "=========================================================="
echo "Format  : awld | aws_delete_lightsail [listado instancias]                         "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
FILTRO=$*

STATUS=0
echo "Filtro pasado : ${FILTRO}"
for instance in ${FILTRO} ; do
echo "instance :  ${instance}"
#  hay que ver si está parada
# STATE 16 running
STATE=$(aws lightsail get-instance-state --instance-name ${instance} --output text | tr '\t' ' '  | cut -d ' ' -f3)

echo $STATE
if [ "${STATE}" != "running" ] ; then
aws lightsail delete-instance --instance-name  ${instance}  &> /dev/null
STATUS=$(expr ${STATUS} + $? )
else
echo "instance started : ${instance} . Please stop to delete"
fi

done

echo "Deleted Instances - Code :  ${STATUS}"

fi
}

#-----------------------------------------------------------------------------------------

aws_deleteforce_lightsail()
{
VER="0.0.2"

if [ "${1}" == "-?" -o "${1}" == ""  ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Borrado de instancias lightsail (Las para y las borra) [$VER]					"
echo "=========================================================="
echo "Format  : awldd | aws_deleteforce_lightsail [listado instancias]                         "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
FILTRO=$*

STATUS=0
echo "Filtro pasado : ${FILTRO}"
for instance in ${FILTRO} ; do
echo "instance :  ${instance}"
#  hay que ver si está parada
# STATE 16 running

#echo $STATE
while [ "${STATE}" != "stopped" ] ; do
aws_stop_lightsail ${instance}
sleep 5
STATUS=$(expr ${STATUS} + $? )
STATE=$(aws lightsail get-instance-state --instance-name ${instance} --output text | tr '\t' ' '  | cut -d ' ' -f3)
done

aws lightsail delete-instance --instance-name  ${instance}  &> /dev/null

done

echo "Starting Deleting Instances - Code : ${STATUS}"

fi
}

#-----------------------------------------------------------------------------------------

# alias awlddw
aws_deleteforce_and_wait_lightsail()
{
VER="0.0.2"

if [ "${1}" == "-?" -o "${1}" == ""  ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Borrado de instancias lightsail (Las para las borra y espera) [$VER]					"
echo "=========================================================="
echo "Format  : awlddw | aws_deleteforce_and_wait_lightsail [listado instancias]                         "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

FILTRO=$*

FILTRO_ADAPTED="$(echo ${FILTRO} | tr ' ' '|' )"


aws_deleteforce_lightsail "${FILTRO}"



#echo $STATE
COUNT_INSTANCES=$(aws_list_lightsail | egrep ${FILTRO_ADAPTED}  | wc -l)

while [ "${COUNT_INSTANCES}" != "0" ] ; do
sleep 5

COUNT_INSTANCES=$(aws_list_lightsail | egrep ${FILTRO_ADAPTED}  | wc -l)
done

echo "Deleted Instances - Code : ${STATUS}"

fi

}