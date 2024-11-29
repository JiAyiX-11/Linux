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


inst_gnome() {
	sudo apt install -y kali-desktop-gnome 
	sudo apt install -y gdm3
	sudo dpkg-reconfigure gdm3
 	sudo apt install gnome-tweaks -y
  	sudo apt install gnome-terminal -y
   	sudo apt install gnome-shell-extensions -y
    sudo apt install dconf-editor -y
	sudo update-alternatives --config x-session-manager
}

obligatorio() {
	sudo apt install tree -y
	sudo apt install net-tools -y
  	sudo apt install bat -y
	sudo apt install curl -y
  	sudo apt install wget -y
    sudo apt install figlet -y
    sudo apt install lolcat -y
	sudo apt install neofetch -y
	sudo apt install rofi -y
 	sudo apt install firefox && sudo apt install firefox-locale-es
	sudo cp -rfv JiAyiX/exa /usr/local/bin/
}

mover() {
	# Editor Nano
	sudo cp -f JiAyiX/rc/nanorc.txt /etc/nanorc
	# Página Web
	sudo cp -f JiAyiX/JiAyiX.html /var/www/html || sudo cp -f
	JiAyiX/JiAyiX.html ~
	# Terminal de Gnome
	sudo cp -rfv JiAyiX/skin/tema_JiAyi /usr/share/themes | lolcat && sudo cp -rfv JiAyiX/skin/cursor_JiAyi /usr/share/icons | lolcat
	sudo cp -rfv JiAyiX/skin/Kali-Purple-Dark /usr/share/themes | lolcat
	# Fondo de Pantalla
  	sudo cp -rf ../Fondos/*.* ~/Imágenes || sudo cp -rf ../Fondos/*.* ~/Pictures
	# Atajos de Gnome
	dconf load / < JiAyiX/atajos/atajos.txt
	# bashrc
	cat JiAyiX/rc/bashrc.txt > ~/.bashrc
	# firefox
	tar -xzvf JiAyiX/firefox/firefox.tar.gz -C ~/.mozilla/firefox | 
	lolcat
}

zsh() {
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
	git clone https://github.com/zsh-users/zsh-history-substring-search ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search
	git clone https://github.com/zdharma-continuum/alias-finder ~/.oh-my-zsh/custom/plugins/alias-finder
	cat JiAyiX/rc/zshrc.txt > ~/.zshrc
}

otros() {
	./superfile.sh
	sudo ./idioma.sh
}

fin() {
	figlet -f slant "JiAyiX" -c | lolcat
	echo -e "${ROJO}"
	read -p "PULSA CUALQUIER TECLA PARA REINICIAR ......"
	echo -e "${Null}"
	sudo reboot
}





# Instalar los Paquetes Necesarios.
obligatorio

# Instalar GNOME como Interfáz Gráfica.
inst_gnome

# Personalizaciñon JiAyiX
mover

# plugin de zsh y personalización de JiAyiX
zsh

# Limpiar
clear

# Reiniciar
fin
