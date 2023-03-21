#!/bin/bash
#
# Script version 0.0.3 - 2022_Jul
#
# Definicion de colores - Compatibilidad MACOS
#-------------------------------------------------------
# 0	Black
# 1	Red
# 2	Green
# 3	Yellow
# 4	Blue
# 5	Magenta
# 6	Cyan
# 7	White
# 9	Reset to default color

# \[   - Inicio de secuencia de caracteres no imprimibles

dim="$(tput dim)"

textreset_general="$(tput sgr0)" # reset the foreground colour
red="$(      tput setaf 1)"
green="$(    tput setaf 2)" 
yellow="$(   tput setaf 3)" 
blue="$(     tput setaf 4)" 
magent="$(   tput setaf 5)" 
cyan="$(     tput setaf 6)" 
white="$(    tput setaf 7)" 
black="$(    tput setaf 0)" 


# REF : https://linuxcommand.org/lc3_adv_tput.php
#       http://mywiki.wooledge.org/BashFAQ/037
#       https://www.linuxtotal.com.mx/index.php?cont=info__tips_017
