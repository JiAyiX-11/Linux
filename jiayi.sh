#!/bin/bash

# Colores de texto
Negro='\033[0;30m'
Rojo='\033[0;31m'
Verde='\033[0;32m'
Amarillo='\033[0;33m'
Azul='\033[0;34m'
Morado='\033[0;35m'
Cian='\033[0;36m'
Blanco='\033[0;37m'

# En Negrita
NEGRO='\033[1;30m'
ROJO='\033[1;31m'
VERDE='\033[1;32m'
AMARILLO='\033[1;33m'
AZUL='\033[1;34m'
MORADO='\033[1;35m'
CIAN='\033[1;36m'
BLANCO='\033[1;37m'

# Fondo de texto
NegroBg='\033[40m'
RojoBg='\033[41m'
VerdeBg='\033[42m'
AmarilloBg='\033[43m'
AzulBg='\033[44m'
MoradoBg='\033[45m'
CianBg='\033[46m'
BlancoBg='\033[47m'

# Estilos
Subrayado='\033[4m'
Parpadeo='\033[5m'
Invertido='\033[7m'
Oculto='\033[8m'
Null='\033[0m'






while true
do
clear
echo -e "${BlancoBg}                                                ${Null}"
echo -e "${ROJO}${BlancoBg}${Parpadeo}   JiAyiX                                       ${Null}"
echo -e "${BlancoBg}                                                ${Null}"
echo -e "${NEGRO}${BlancoBg}          1. Gnome-Terminal.                    "
echo -e "          2. Paquetes Terceros                  "
echo -e "          3. Bash.                              "
echo -e "          4. Zsh.                               "
echo -e "          5. Tema_bspwn.                        "
echo -e "          6. Salir.                             "
echo -e "                                                "
echo -e "                                                ${Null}"
echo -e "${AMARILLO}"
read -p "Opción a Realizar: " num
echo -e "${Null}"
case $num in
	1) #Terminal
		sudo apt install gnome-tweaks -y
		sudo apt update && sudo apt upgrade gnome-tweaks -y
		sudo cp -rfv JiAyiX/skin/tema_JiAyi /usr/share/themes && sudo cp -rfv JiAyiX/skin/cursor_JiAyi /usr/share/icons
		gnome-tweaks;;

	2) #Instalación de Paquetes y Actualizar
		sudo apt install tree -y
		sudo apt install net-tools -y
		sudo apt install exa -y
  		sudo apt install bat -y
		sudo apt install curl -y
  		sudo apt install wget -y;;

	3) #Personalización Bash
		cat JiAyiX/rc/bashrc.txt > ~/.bashrc
		echo -e "${VERDE}"
		read -p "  Operación readizada con éxito. Toca caunquier tecla para continuar:" basura
		echo -e "${Null}";;
  
	4) #Personalización Zsh
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
		git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
		git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
		git clone https://github.com/zsh-users/zsh-history-substring-search ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search
		git clone https://github.com/zdharma-continuum/alias-finder ~/.oh-my-zsh/custom/plugins/alias-finder
		cat JiAyiX/rc/zshrc.txt > ~/.zshrc
  		echo -e "${VERDE}"
		read -p "  Operación readizada con éxito. Toca caunquier tecla para continuar:" basura
		echo -e "${Null}";;
  
	5) #bspwn
#		git clone https://github.com/r1vs3c/auto-bspwm.git
# 		cd /home/$(whoami)/auto-bspwm
#     		sudo chmod *.sh
#       		./setup.sh
  		echo -e "${ROJO}"
		read -p "  NO DISPONIBLE. Toca caunquier tecla para continuar:" basura
		echo -e "${Null}";;
	6) #Salir
		break;;

esac
done
clear