#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- get_backup_server_data
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- gsd - sxto
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Realiza un backup local de una ruta
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T make local backup path
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P [PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E get_backup_server_data /abc/dd -- Realiza un backup local de una ruta
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
get_backup_server_data()
{
VER="0.0.2"

get_backup_server_data_FUN="get_backup_server_data"
get_backup_server_data_NFO="Realiza un backup local de una ruta [$VER]($DEP) @${QP}"
get_backup_server_data_FMT="get_backup_server_data [PATH]"
get_backup_server_data_EXA="get_backup_server_data --> Sync current folder if is SSD folder"

get_backup_server_data_OUT=0
get_backup_server_data_ERR=""

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${get_backup_server_data_NFO}" "${get_backup_server_data_FMT}" "${get_backup_server_data_EXA}"
#--------------------------------------------------------------------------------
else

if [ "${BK_TYPE}" == "" ] ; then
#-Por defecto es un backup especifico de file system
BK_TYPE=fs
fi

if [ "${BK_STRATEGY}" == "" ] ; then
#-Por defecto es una estrategia mensual mm | yy | dd | aa
BK_STRATEGY=mm
fi

if [ "${BK_SUBTYPE}" == "" ] ; then
#-Por defecto es una site de drupal
BK_SUBTYPE=drup
fi

#-Esta informacion implica hacerlo de un site

##BK_PATH_SPEC="/zback/spec/${BK_TYPE}/${BK_STRATEGY}/${BK_SUBTYPE}/z${SERVER_LETTER}/t${YEAR_BK}/${MONTH_LETTER}_${MONTH_NUMBER}"

#-Tenemos varios tipos de Backup [BK_TYPE]
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
#-BK_TYPE: fs | ff | db | ch | se | nf
#--------------------------------------------------------------------------------
#-1.File system (cada vez menos transcendente)
#-2.Files folder
#-3.BBDD (trabajando para que cada vez sea menos transcendente)
#-4.Cache (Intrascendente)
#-5.Cache de busquedas de Solr o Sphinx (preparando estructura
#-6.Informacion del dominio - subdominio (crucial - aunque es un dato que puede regenerarse)
#--------------------------------------------------------------------------------

#-Vamos a definir tambien estrategias
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
#-BK_STRATEGY: yy | mm | dd
#--------------------------------------------------------------------------------
#-1.Anual   [yy]
#-2.Mensual [mm] ( se guardan los tres ultimos meses )
#-3.Diario  [dd] ( en portales en plena produccion)
#-4.Actual  [aa] ( Backup que se sobrescribe - Obligatorio para todos los sites )

#-En algunos casos tenemos un subtipo
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
#-DB_SUBTYPE: dbs | dbx
#-FS_SUBTYPE: drup | mgnt | mail
#--------------------------------------------------------------------------------

#-Es una ruta para ajustar posteriormente	
#-Los Backups especificos podemos indicarlos por site

# /zback/spec/fs/mm/drup/zd/arq/comandos/sphinx/sphinx_dbrqx_com/v_0_0_1/t2016/ago_08/

BK_PATH_SPEC="/zback/spec/${BK_TYPE}/${BK_STRATEGY}/${BK_SUBTYPE}/z${SERVER_LETTER}/"
BK_PATH_SPEC="${BK_PATH_SPEC}${SITE_PATH}${CLEAN_DOMAIN}/${CLEAN_SITE_VERSION}/"
BK_PATH_SPEC="${BK_PATH_SPEC}t${YEAR_BK}/${MONTH_LETTER}_${MONTH_NUMBER}"

#-Tenemos tambien backups completos y backups especificos
#-Los Backups completos de servidor (full) debemos indicarlos en otra estructura por servidor
BK_PATH_FULL="/zback/full/${BK_TYPE}/${BK_STRATEGY}/${BK_SUBTYPE}/z${SERVER_LETTER}/t${YEAR_BK}/${MONTH_LETTER}_${MONTH_NUMBER}"



#-Get Server Data
gsd
get_backup_server_data_OUT=$(expr  ${get_backup_server_data_OUT} + ${gsd_OUT})
get_backup_server_data_ERR="${get_backup_server_data_ERR}${gsd_ERR}"

fi

}
