#!/bin/bash
br="\033[91m"
bg="\033[92m"
by="\033[93m"
bb="\033[94m"
bp="\033[95m"
bc="\033[96m"
re="\033[00m"
bl="\033[5m"
os=$(uname -s)
case $os in
	Linux) apt="apt";;
	Mac) apt="brew";;
	Android) apt="pkg";;
esac
if [[ $EUID != 0 ]]; then
	echo "Please run as root"
	exit
fi
command -v curl > /dev/null || $apt install curl -y
command -v jq > /dev/null || $apt install jq -y
path=$(echo $PATH | cut -d ":" -f 1)
if [[ -f geolocation ]]; then
	mv geolocation $path/
	chmod +x ${path}/geolocation
fi
xdg-open https://t.me/FSociety_MM
sleep 5
clear
echo -e "
${bl}${br}██╗     ██╗   ██╗ ██████╗ █████╗ ███████╗${re}
${bl}${br}██║     ██║   ██║██╔════╝██╔══██╗██╔════╝${re}
${bl}${br}██║     ██║   ██║██║     ███████║███████╗${re}
${bl}${br}██║     ██║   ██║██║     ██╔══██║╚════██║${re}
${bl}${br}███████╗╚██████╔╝╚██████╗██║  ██║███████║${re}
${bl}${br}╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝${re}

${bb}DEVELOPER      ${by}=${bb} ${br}LUCAS                   ${re}
${bb}CHANNEL LINK   ${by}=${bb} ${bc}\e[4mhttps://t.me/FSociety_MM${re}
"
echo -e "\t${bb}[${by}*${bb}] ${bg}run Type '${br}geolocation ipAddress${bg}'"
echo -e "\t${bb}[${by}*${bb}] ${bg}example  '${br}geolocation 149.154.167.99${bg}'"
exit
