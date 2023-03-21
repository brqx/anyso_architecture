#!/bin/bash

#Crea un usuario estilo brqx
myucr()
{
PROYECTO=$1
PASS=$2

if [ "${1}" == "-?" -o  "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Generando con privilegios el usuario PROYECTO_brqx        "
echo "=========================================================="
echo "Format  : myucr CADENA_USUARIO		                    "
echo "----------------------------------------------------------"
echo "Example : myucr rct --> Genera usuario brqx_rct			"
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

if [ "${PASS}" == "" ] ; then
PASS='grXU#2016_50_drupal'
fi


echo "Generando con privilegios el usuario ${PROYECTO}_brqx"

mysql -u root -e "CREATE USER '${PROYECTO}_brqx'@'localhost' IDENTIFIED BY '${PASS}'; flush privileges;"

fi
}

#Elimina un usuario estilo brqx
myudr()
{
USUARIO=$1

if [ "${1}" == "-?" -o  "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Eliminando usuario USUARIO_brqx                           "
echo "=========================================================="
echo "Format  : myudr CADENA_USUARIO                     		"
echo "----------------------------------------------------------"
echo "Example : myudr rct --> Elimina usuario brqx_rct			"
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

echo "Eliminandos el usuario ${USUARIO}"

mysql -u root -e "DROP USER '${USUARIO}_brqx'@'localhost'; flush privileges;"

fi
}

#Crea privilegios para usuario
myugr()
{
USUARIO=$1

if [ "${1}" == "-?" -o  "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Crea privilegios para usuario USUARIO_brqx                "
echo "=========================================================="
echo "Format  : myugr CADENA_USUARIO                     		"
echo "----------------------------------------------------------"
echo "Example : myugr rct --> Genera privilegios para brqx_rct	"
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

echo "Generando con privilegios el usuario ${USUARIO}_brqx"

mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO  '${USUARIO}_brqx'@'localhost'; flush privileges;"

fi
}

#Crea usuario y genera privilegios para usuario
myucygr()
{
USUARIO=$1

if [ "${1}" == "-?" -o  "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Crea usuario y genera privilegios para usuario USUARIO_brqx                           "
echo "=========================================================="
echo "Format  : myucygr CADENA_USUARIO                     		"
echo "----------------------------------------------------------"
echo "Example : myucygr rct --> Crea y genera privilegios para brqx_rct			"
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
else

myudr ${USUARIO}
myucr ${USUARIO}
myugr ${USUARIO}

fi
}

myulist()
{
USUARIO=$1

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Listado usuarios brqx style                               "
echo "=========================================================="
echo "Format  : myulist CADENA_USUARIO                     		"
echo "----------------------------------------------------------"
echo "Example : myulist rct --> Lista usuarios rct"
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
elif [ "${1}" == "" ] ; then

echo "Listado de usuarios del servidor estilo brqx"

mysql -u root -e "select host, user, password from mysql.user;" | grep brqx

else

echo "Listado de usuarios del servidor estilo brqx"

mysql -u root -e "select host, user, password from mysql.user;" | grep brqx | grep ${USUARIO}

fi

}


myumail_create()
{
#-Function to create Databases and Mail Users
mysql -u root -e "CREATE USER 'postfixadmin'@'localhost' IDENTIFIED BY 'exim1234'; flush privileges;"
mysql -u root -e "CREATE USER 'roundcube'@'localhost' IDENTIFIED BY 'exim1234'; flush privileges;"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO  'roundcube'@'localhost'; flush privileges;"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO  'postfixadmin'@'%' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0 ;"
mysql -u root -e "UPDATE mysql.user SET password=PASSWORD('exim1234') where user='roundcube'";

# mysql -u postfixadmin -pexim1234
}
