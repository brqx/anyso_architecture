#!/bin/bash
#
# Script version 0.0.2
#
#Comprobacion de servidores
#example mydbex path

OUTDIR=/brqz/

if [ ! -d "${OUTDIR}" ] ; then
OUTDIR=/brqi/
fi

if [ -d "${OUTDIR}" ] ; then

NEW_CK=${OUTDIR}ck_new.chk
OLD_CK=${OUTDIR}ck_old.chk

touch ${OUTDIR}ck_new.chk		&>	/dev/null
touch_OUT=$?

if [ "${touch_OUT}" == "0" ] ; then

ckallall &> ${OUTDIR}ck_new.chk

if [ -f "${NEW_CK}" ] ; then
#Si no se genera no hacemos nada

if [ -f "${OLD_CK}"  ] ; then
diff ${OLD_CK} ${NEW_CK} &>		/dev/null
diff_out=$?
else
diff_out="0"
fi

if [ "${diff_out}" != "0" ] ; then
#-Hay que comprobar

echo "=========================================================================================="
echo " ${ckall_HDR}                                                                             "
echo "--------=------------=-----------------------------------------------=-------=------------"
colordiff ${OLD_CK} ${NEW_CK} | tail -1 
echo "=========================================================================================="

else
#-Es la primera vez que se genera el archivo - Lo mostramos
cat ${NEW_CK}
fi

mv -f ${NEW_CK} ${OLD_CK}

fi 

fi

fi
