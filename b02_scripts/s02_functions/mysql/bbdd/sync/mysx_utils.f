#!/bin/bash

#Sincroniza una BD de un servidor a otro
#example dbreplace unixy _p50 rct brqxrct.com unixy.es

fix_remote_db()
{
db_server=${1}
user_remote=${2}
bd_remote=${3}

ssh -oPort=60022 root@${db_server} "/root/scripts/sync/mysql/db_grantuser.x  ${user_remote}  ${bd_remote}"
}

xfer_mysql_db() 
{
db_local=${1}
db_remote=${2}	
db_server=${3}
mysqldump -u root ${db_local} > ${local_outgoing}/${db_remote}.sql
md5sum ${local_outgoing}/${db_remote}.sql > ${local_outgoing}/${db_remote}.sql.md5
rsync -avz -e "ssh -oPort=60022" ${local_outgoing}/${db_remote}.sql* root@${db_server}:${remote_outgoing} &> /dev/null
        
ssh -oPort=60022 root@${db_server} "mysql -u root -e 'drop database ${db_remote}'  &> /dev/null"   	&> /dev/null
ssh -oPort=60022 root@${db_server} "mysql -u root -e 'create database ${db_remote}' &> /dev/null"  	&> /dev/null
ssh -oPort=60022 root@${db_server} "/root/scripts/load_db.x  ${db_remote} &> /dev/null"				&> /dev/null

# Ahora falta eliminar todo
}

