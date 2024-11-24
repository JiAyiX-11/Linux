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
echo -e "          2. Paquetes OBLIGATORIO.              "
echo -e "          3. Bash.                              "
echo -e "          4. Zsh.                               "
echo -e "          5. Atajos GNOME.                      "
echo -e "          6. Idioma.                            "
echo -e "          7. Editor Nano.                       "
echo -e "                                                "
echo -e "          *. Salir.                             "
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
		sudo cp -rfv JiAyiX/skin/Kali-Purple-Dark /usr/share/themes
  		sudo cp -rfv ../Fondos/*.* ~/Imágenes || sudo cp -rfv ../Fondos/*.* ~/Image

		gnome-tweaks;;


	2) #Instalación de Paquetes y Actualizar
		sudo apt install tree -y
		sudo apt install net-tools -y
  		sudo apt install bat -y
		sudo apt install curl -y
  		sudo apt install wget -y
    		sudo apt install figlet -y
      		sudo apt install lolcat -y
		sudo apt install neofetch -y
		sudo cp -rfv JiAyiX/exa /usr/local/bin/
		./superfile.sh;;


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


	5) #Atajos
		dconf load / < JiAyiX/atajos/atajos.txt
  		echo -e "${VERDE}"
		read -p "Atajos completados." basura
		echo -e "${Null}";;


	6) #Idioma
		sudo ./idioma.sh;;


	7) # Nano
		sudo cp -f JiAyiX/rc/nanorc.txt /etc/nanorc
		echo -e "Las Copias de Seguridad se guardarán en:  ${MORADO}/var/tmp${Null}"
		echo -e "${VERDE}"
		read -p "Toca cyalquier tecla para continuar:" basura
		echo -e "${Null}";;

	*) #Salir
		break;;

esac
done
clear
figlet -f slant "JiAyiX" -c | lolcat
echo -e "Ejecute:  ${MORADO}source ~/.zshrc  ${Null} para actualizar la configuración."
