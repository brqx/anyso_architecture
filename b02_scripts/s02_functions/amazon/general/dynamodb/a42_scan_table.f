#!/bin/bash
#
# Script version 0.0.1
#
# Scan de tablas de DynamoDb
# alias awlefs

# awdy -> aws dynamodb
# awdys
aws_dynamodb_scan_table()
{
VER="0.0.2"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "   Scan de tablas de DynamoDb  [$VER]	    			             		"
echo "=========================================================="
echo "Format  : awdys | aws_dynamodb_scan_table TABLA [ FIELD VALUE [REGION] ]  "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Comprobacion Arrays asociativos

declare -A &> /dev/null
if [ $? -ne 0 ] ; then
echo "No dispones de Arrays asociativos. Comprueba version bash en tu sistema"
else

# Tiene dos modos de funcionamiento
# 1. Pasando el parametro Region
#
# 2. Usando la variable aws_region

TABLA=$1
FIELD=$2
VALUE=$3
REGION=$4

__check_aws_region_account

if [ "${aws_region_inner}" != "" ] ; then

#----====----====----====----====----====----====----====----====
#           I N I C I O    D E   L A    L O G I C A 
#----====----====----====----====----====----====----====----====

echo "------------------------------------------------------"
echo "       Scan de tablas de DynamoDb                  "
echo "--==--==--==--==--==--==--==--==--==--==--==--==--==--"

__tmp_file

# aws dynamodb scan \
#    --table-name NameOfTheTableToBeScanned
#    --filter-expression "lastName = :name" \
#    --expression-attribute-values '{":name":{"S":"Doe"}}'


COMANDO="aws dynamodb scan --table-name ${TABLA} --region ${aws_region_inner} "

# --filter-expression "id = :id" --expression-attribute-values '{":id":{"S":"a3520"}}' 
FILTRO="--filter-expression \"${FIELD}=:${FIELD}\" "
FILTRO2="--expression-attribute-values file://${TMP_FILE}_values " 

echo -n "{ \":${FIELD}\":{\"S\":\"${VALUE}\" } }" > "${TMP_FILE}_values"

# echo "FIL : $COMANDO ${FILTRO} ${FILTRO2}"

#COMANDO="${COMANDO} ${FILTRO} ${FILTRO2}"
#COMANDO="${COMANDO} | jq -r '.Items' | tr -d '{\n'  | tr -d ']' | tr -s ' ' | tr '},' '\nZ' | tr ' ' '@'  > ${TMP_FILE}"

# Solo conseguimos ejecutar este comando generandolo externamente como un archivo

if [ ${VALUE} = "" ] ; then
command=("${COMANDO}" )
else 
command=("${COMANDO} ${FILTRO} ${FILTRO2}" )
fi

echo "${command[@]}" > "${TMP_FILE}_cmd"

chmod +x "${TMP_FILE}_cmd"

${TMP_FILE}_cmd  | jq -r '.Items' | tr -d '{\n'  | tr -d ']' | tr -s ' ' | tr '},' '\nZ' | tr ' ' '@'  > ${TMP_FILE}


# Ya tenemos el ID , ahora es un simple for y listo
ID_FIELD=$(aws dynamodb describe-table --table-name ${TABLA} --region ${aws_region_inner} | jq -r ".Table.KeySchema[0].AttributeName" )

#Algoritmo

#iterar 
#cargar_valores
#si hay id --> imprimir valores y  salto de linea

CABECERA=""
#Ejemplo de fila X@"id":@"S":@"a3520"@
for i in $(cat ${TMP_FILE} ) ; do

if [ "$i" != "@" ] ; then
#-----------------------------------------------------------

NOMBRE=$( echo $i | cut -d '"' -f2 )

# Si no esta el nombre en la cabecera, lo incluimos
if [[ "$CABECERA" != *"$NOMBRE"* ]] ; then
#echo "Ya esta dentro de la cabecera : $NOMBRE - $CABECERA"
#else
CABECERA="${CABECERA}${NOMBRE}\t"
fi
#-----------------------------------------------------------
fi

done

echo -e "${CABECERA}"
echo "------------------------------------------------------"

declare -A CAMPOS

PRIMER_ID=1
#Ejemplo de fila X@"id":@"S":@"a3520"@
for i in $(cat ${TMP_FILE} ) ; do

if [ "$i" != "@" ] ; then
#-----------------------------------------------------------

NOMBRE=$( echo $i | cut -d '"' -f2 )
VALUE=$(  echo $i | cut -d '"' -f6 )

# Metemos los valores en un array
CAMPOS[${NOMBRE}]=$VALUE
# Si no esta el nombre en la cabecera, lo incluimos

# echo "En array : $NOMBRE  -  $VALUE  : ${CAMPOS[$NOMBRE]} "
# echo "Field ID : ${ID_FIELD}"

else
# Cada vez que llega la arroba se procesa la linea
__procesar_cadena_tabla_dynamodb
fi

done

# Falta procesar la ultima y hay que ver cuando procesarla

echo "------------------------------------------------------"

#----====----====----====----====----====----====----====----====
#              F I N    D E   L A    L O G I C A 
#----====----====----====----====----====----====----====----====

fi

# END ARRAYS ASSOCIATOVOS
fi

fi
}

__procesar_cadena_tabla_dynamodb()
{
# Tenemos los valores en campo[Nombre] y de cabecera sacamos los nombres

LINEA=""
for i in $(echo -e "${CABECERA}" | tr "\t" " " ) ; do   
#echo "Probando $i"
LINEA="$LINEA${CAMPOS[$i]}\t"
#Vaciamos los campos
CAMPOS[$i]=""
done
echo -e "$LINEA"


}

