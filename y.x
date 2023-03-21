#!/bin/bash
#-------------------------------------------------------------------
# Profile Usuario brqx - BrqZ - I+D
# BRQX / NG - Rct - 2015
#-------------------------------------------------------------------
VERSION_PROFILE="V 1.0"          #  Version del Profile actual
FECHA_PROFILE="Junio 2015"
#-==================================================================
#-- Invocaciones WEB
#-------------------------------------------------------------------
# - DwLista Main : Pendiente
#
#---------------------------------------------------------------------#
#Definicion de variables
#---------------------------------------------------------------------#

#-------------------------------------------------------------------
#- Fijacion Carpeta Scripting 	==	Nivel 0
#-==================================================================

#-Usado para definiar la arquitectura root
AA=/brqx/arquitectura/zarq/



#-------------------------------------------------------------------
#- Scripting Initial DEF	==	Nivel 0
#-==================================================================

L_AA=${AA}a01_lists/
S_AA=${AA}b02_scripts/
D_AA=${AA}c03_dat/

#-------------------------------------------------------------------
#- Scripting Base LISTAS		==	Nivel 1
#-==================================================================

LAA_CORE=${L_AA}a00_core/
LAA_FUNC=${L_AA}a02_functions/
LAA_ALIA=${L_AA}a04_alias/
LAA_EXEC=${L_AA}a07_exec/

#-------------------------------------------------------------------
#- Scripting Base SCRIPTS		==	Nivel 1
#-==================================================================

SAA_CORE=${S_AA}a00_core/
SAA_FUNC=${S_AA}a02_functions/
SAA_EXEC=${S_AA}a07_exec/

OUTOUT="CLEAN"
#-==================================================================
#- 02 - F U N C I O N E S 
#-==================================================================

#-------------------------------------------------------------------
. ${LAA_CORE}aa_02.lf
#-------------------------------------------------------------------

#-==================================================================
#- 04 - A L I A S 
#-==================================================================

#-------------------------------------------------------------------
. ${LAA_CORE}aa_04.la
#-------------------------------------------------------------------

#-==================================================================
#- 07 - E J E C U C I O N E S
#-==================================================================

#-------------------------------------------------------------------
#. ${LAA_CORE}aa_07.lx
#-------------------------------------------------------------------

