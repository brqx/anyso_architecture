#!/bin/bash
#---------------------------------------------------------------------------------
#
# Script version 0.0.2 -- 2021 - November
# Farmacia Zaragoza - Brqx Architectures
#
# Docker Hooks for functions - Pending
#
# __d_file : Manage TMP files
# __d      : Define d alias
#
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Manage Docker aliases 
# Para funciones no se recomienda
__d()
{
alias d='docker '

}

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=


# Manage TMP files for Aws commands
__d_file()
{
if [ "${TMP_FILE}" == "" ] ; then
TMP_FILE="/tmp/output_command_brqx"
fi
}

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

