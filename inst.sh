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
echo "${BlancoBg}                                                ${Null}"
echo "${ROJO}${BlancoBg}${Parpadeo}   JiAyiX                                       ${Null}"
echo "${BlancoBg}                                                ${Null}"
echo "${NEGRO}${BlancoBg}          1. Gnome-Terminal.                    "
echo "          2. Paquetes Terceros                  "
echo "          3. Bash.                              "
echo "          4. Zsh.                               "
echo "          5. Salir.                             "
echo "                                                "
echo "                                                ${Null}"
echo "${AMARILLO}"
read -p "Opción a Realizar: " num
echo "${Null}"
case $num in
	1) #Terminal
		sudo apt install gnome-tweaks
		sudo apt update && sudo apt upgrade gnome-tweaks -y
		sudo cp -rfv skin/tema_JiAyi /usr/share/themes && sudo cp -rfv skin/cursor_JiAyi /usr/share/icons
		gnome-tweaks;;

	2) #Instalación de Paquetes y Actualizar
		sudo apt install tree
		sudo apt install net-tools
		sudo apt install exa || sudo snap install lsd
		sudo apt install curl || sudo apt install wget
		sudo apt update && sudo apt upgrade -y;;

	3) #Personalización Bash
		cat rc/bashrc.txt > ~/.bashrc
		echo "${VERDE}"
		read -p "  Operación readizada con éxito. Toca caunquier tecla para continuar:" basura
		echo "${Null}";;
	4) #Personalización Zsh
		sudo apt install git
		sudo apt update && sudo apt upgrade git -y
		while true
		do
		clear
		echo "${BlancoBg}                                                ${Null}"
		echo "${ROJO}${BlancoBg}${Parpadeo}   JiAyiX                                       ${Null}"
		echo "${BlancoBg}                                                ${Null}"
		echo "${NEGRO}${BlancoBg}          1. Instalar Zsh                       "
		echo "          2. Pluggins                           "
		echo "          3. Salir.                             "
		echo "                                                "
		echo "                                                ${Null}"
		echo "${AMARILLO}"
		read -p "Opción a Realizar: " num1
		echo "${Null}"
		case $num1 in 
			1) #Instalar Zsh
				echo "${ROJO}${NegroBg}   IMPORTANTE!!!                  IMPORTANTE!!!                        IMPORTANTE!!!                            IMPORTANTE!!!                "
				echo "                                                                                                                                             "
				echo "     EN LA INSTALACIÓN DEL ZSH TE PREGUNTARÁN SI QUIERES QUE ZSH SEA COMO EL SHELL PRINCIPAL Y UNA VEZ TERRMINADO SE TERMINARÁ EL SCRIPTS    "
				echo "     POR LO QUE DEBERÁ VOLVER A ABRIR EL SCRIPTS Y AÑADIR LOS PLUGGINS.                                                                      "
				echo "                                                                                                                                             "
				echo "   IMPORTANTE!!!                    IMPORTANTE!!!                     IMPORTANTE!!!                                    IMPORTANTE!!!         ${Null}"
				read -p "Pulsa una tecla para continuar. " basura

				sh/./ohmyzsh.sh;;
			2) #Pluggins
				git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
				git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
				git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
				git clone https://github.com/zsh-users/zsh-history-substring-search ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search
				git clone https://github.com/zdharma-continuum/alias-finder ~/.oh-my-zsh/custom/plugins/alias-finder
				cat rc/zshrc.txt > ~/.zshrc;;

			3) #SalirZsh
				break;;
		esac
		done;;

	5) #Salir
		break;;

esac
done
clear
