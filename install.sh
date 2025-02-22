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



banner() {

    echo -e "${NegroBG}${AMARILLO}${Parpadeo}"
    echo -e    "      _ _    _         ___  __ "
    echo -e    "     | (_)  / \  _   _(_) \/ / "
    echo -e    "  _  | | | / _ \| | | | |\  /  "
    echo -e    " | |_| | |/ ___ \ |_| | |/  \  "
    echo -e    "  \___/|_/_/   \_\__, |_/_/\_\ "
    echo -e    "                 |___/         "
    echo -e "${Null}"
}

barra() {
    local duration=$1    # Duración total en segundos
    local width=50       # Ancho de la barra

    for ((i=0; i<=duration; i++)); do
        local percent=$(( (i * 100) / duration ))
        local filled=$(( (i * width) / duration ))
        local empty=$(( width - filled ))

        # Construir la barra de progreso
        local bar="$(printf '%0.s#' $(seq 1 $filled))"
        local spaces="$(printf '%0.s-' $(seq 1 $empty))"

        # Mostrar barra con porcentaje sin errores de formato
        printf "\r[%-${width}s] %3d%%" "${bar}${spaces}" "$percent"
        sleep 1
    done
    echo -e "\n Proceso completado"
}

mensaje() {
    clear
    # Mensaje Banner 
    banner

    # Paquetes Necesarios
    echo -e "${VERDE}" 
    echo -e "[+] Instalandos los Recursos Necesarios..."
    echo -e "${Null}"
    sudo cp -f scripts/mover/internos/exa /usr/local/bin/ && sudo cp -f scripts/mover/internos/exa /usr/bin/
    sudo cp -f scripts/mover/internos/ip /usr/local/bin && sudo cp -f scripts/mover/internos/ip /usr/bin/ 
    sudo cp -f scripts/mover/internos/whois /usr/local/bin && sudo cp -f mover/internos/whois /usr/bin
    sudo cp -f scripts/mover/internos/which.debianutils /usr/local/bin && sudo cp -f scripts/mover/internos/which.debianutils /usr/bin
    scripts/./recursos.sh

    # Interfáz Gnome
    echo -e "${AMARILLO}" 
    read -p "[?] ¿Quieres instalar la interfaz gráfica GNOME? (s/n): " respuesta
        if [[ "$respuesta" =~ ^[sS]$ ]]; then
            scripts/./gnome.sh
        else
            echo -e " " 
            echo -e "[?] Omitiendo la instalación de GNOME..."
        fi
    echo -e "${Null}"

    # Personalización Gnome
    echo -e "${VERDE}"
    echo -e "[+] Personalizando el Gnome...${Null}"
    echo -e " "
    barra 2
    echo -e "${VERDE}"
    echo -e "[+] Ruta de los Fondos..."
    sudo cp -rf scripts/mover/Fondos/*.* /usr/share/backgrounds
    echo -e "${BLANCO}/usr/share/backgrounds${Null}"
    echo -e " "
    barra 2
    echo -e "${VERDE}"
    echo -e "[+] Ruta de la Página Web"
    sudo cp -f scripts/mover/web/*.* /var/www/html
    echo -e "${BLANCO}/var/www/html${Null}"
    echo -e " "
    echo -e "${VERDE}"
    echo -e "[+] Configurando Tema del Terminal...${Null}"
    sudo cp -rf scripts/mover/tema/tema_JiAyiX /usr/share/themes
    barra 10
    echo -e " "
    echo -e "${VERDE}"
    echo -e "[+] Configurando Cursor...${Null}"    
    sudo cp -rf scripts/mover/cursor/cursor_JiAyiX /usr/share/icons
    barra 10
    echo -e " "
    echo -e "${VERDE}"     
    echo -e "[+] Configurando el editor Nano...${Null}"
    sudo cp -f scripts/mover/nano/nanorc.txt  /etc/nanorc
    barra 5
    echo -e " "

    # Personalización JiAyiX
    echo -e "${VERDE}"
    echo -e "[+] Configurando Personalización JiAyiX...${Null}"
    dconf load / < scripts/mover/JiAyiX/atajos.txt
    barra 10

    # Zsh
    echo -e "${VERDE}"
    echo -e "[+] Instalación del Shel Zsh...${Null}"
    scripts/./ohmyzsh.sh
    echo -e " "

    # Personalización Shell
    echo -e "${VERDE}"
    echo -e "[+] Configurando el bash...${Null}"
    cat scripts/mover/shell/bashrc.txt > ~/.bashrc
    barra 2
    echo -e "${VERDE}"    
    echo -e "[+] Configurando el Zsh...${Null}"
    cat scripts/mover/shell/zshrc.txt > ~/.zshrc
    barra 2

    # Fin
    echo -e "${AMARILLO}"
    read -p "[?] Pulsa Cualquier tecla para Terminar..." basura
    echo -e "${Null}" 
    clear
}

mensaje