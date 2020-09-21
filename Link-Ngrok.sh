#!/bin/bash
#
# Created by: Informatic_in_Termux
#
# VARIABLES
#
PWD=$(pwd)
source ${PWD}/Colors.sh
#
# FUNCIONES
#
function Install_Ngrok {
	sleep 0.5
	clear
echo -e "${verde}
 ▄▄▄   ▄▄     ▄▄▄▄   ▄▄▄▄▄▄      ▄▄▄▄    ▄▄   ▄▄▄
 ███   ██   ██▀▀▀▀█  ██▀▀▀▀██   ██▀▀██   ██  ██▀
 ██▀█  ██  ██        ██    ██  ██    ██  ██▄██
 ██ ██ ██  ██  ▄▄▄▄  ███████   ██    ██  █████
 ██  █▄██  ██  ▀▀██  ██  ▀██▄  ██    ██  ██  ██▄
 ██   ███   ██▄▄▄██  ██    ██   ██▄▄██   ██   ██▄
 ▀▀   ▀▀▀     ▀▀▀▀   ▀▀    ▀▀▀   ▀▀▀▀    ▀▀    ▀▀
"${blanco}
}
function Link_Ngrok {
	sleep 0.5
	clear
echo -e "${verde}
▗▖     █       ▗▖        ▗▄ ▗▖               ▗▖
▐▌     ▀       ▐▌        ▐█ ▐▌               ▐▌
▐▌    ██  ▐▙██▖▐▌▟▛      ▐▛▌▐▌ ▟█▟▌ █▟█▌ ▟█▙ ▐▌▟▛
▐▌     █  ▐▛ ▐▌▐▙█       ▐▌█▐▌▐▛ ▜▌ █▘  ▐▛ ▜▌▐▙█
▐▌     █  ▐▌ ▐▌▐▛█▖  ██▌ ▐▌▐▟▌▐▌ ▐▌ █   ▐▌ ▐▌▐▛█▖
▐▙▄▄▖▗▄█▄▖▐▌ ▐▌▐▌▝▙      ▐▌ █▌▝█▄█▌ █   ▝█▄█▘▐▌▝▙
▝▀▀▀▘▝▀▀▀▘▝▘ ▝▘▝▘ ▀▘     ▝▘ ▀▘ ▞▀▐▌ ▀    ▝▀▘ ▝▘ ▀▘
                               ▜█▛▘
"${blanco}
}
function token_ngrok {
	Install_Ngrok
	unzip ngrok-stable-linux-arm.zip
	chmod 777 ngrok
	cp ngrok ${PREFIX}/bin
echo -e -n "${verde}
┌═════════════════┐
█ ${blanco}NGROK AUTHTOKEN ${verde}█
└═════════════════┘
┃
└═>>> "${blanco}
read -r auth_token_ngrok
${auth_token_ngrok}
rm ngrok
sleep 0.5
}
function Tool {
	Link_Ngrok
echo -e -n "${verde}
┌═════════════════════════════════════┐
█ ${blanco}INGRESE EL NOMBRE DE LA HERRAMIENTA ${verde}█
█ ${blanco}QUE NO GENERA EL ENLACE DE NGROK... ${verde}█
└═════════════════════════════════════┘
┃    ${rojo}┌═════════════════════════════════┐
${verde}└═>>>${rojo}█ ${blanco}RESPETA MAYÚSCULAS Y MINÚSCULAS ${rojo}█
${verde}┃    ${rojo}└═════════════════════════════════┘
${verde}┃    ┌═════════════════════┐
└═>>>█ EJEMPLO => ${blanco}CamPhish ${verde}█
┃    └═════════════════════┘
┃
└═>>> "${blanco}
read -r Tool
if [ -x ${HOME}/${Tool} ]
then
cd ${HOME}/${Tool}
rm ngrok > /dev/null 2>&1
cp ${PREFIX}/bin/ngrok ${HOME}/${Tool}
cd
echo -e "${verde}
┌═════════════════════════════════┐
█ [${blanco}√${verde}] ${blanco}LISTO ${verde}[${blanco}√${verde}] ${blanco}ERROR SOLUCIONADO ${verde}█
└═════════════════════════════════┘
"${blanco}
else
echo -e "${rojo}
┌══════════════════════════════┐
█ [${blanco}X${rojo}] ${blanco}LA HERRAMIENTA NO EXISTE ${rojo}█
└══════════════════════════════┘
"${blanco}
sleep 2
Tool
fi
}
#
# CÓDIGO
#
if [ -x ${PREFIX}/bin/ngrok ]
then
Tool
else
token_ngrok
Tool
fi
