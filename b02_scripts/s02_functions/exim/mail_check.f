#!/bin/bash

home_mail_check()
{
OLD_PWD=$PWD
cd /home
for i in *; do  
cd $i/mail/new 2> /dev/null ; 

if [  "$?" == "0" ] ; then   
echo "$i -  $(ls -l  |wc -l) "
cd /home
fi

done

}
