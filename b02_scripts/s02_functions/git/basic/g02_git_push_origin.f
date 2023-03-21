#!/bin/bash
#
# Script version 0.0.0.1
#
# Ejecuta bash en el contenedor
# alias gip

git_get_branch()
{

# Add git branch if its present to PS1
git --version &> /dev/null
if [ "$?" == "0" ] ; then
# git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
parse_git_branch | tr -d ")|("
fi

}

#-------------------------------------------------------------------

git_push_origin()
{
VER="0.0.0.1"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Hace un push origin resolviendo el problema de la rama actual en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : gip | git_push_origin               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Ejecutamos git push origin

git push origin
if [ "$?" != "0" ] ; then
git push --set-upstream origin $(git_get_branch)

fi

fi
}

#-------------------------------------------------------------------

