#!/bin/bash

AMARILLO='\033[1;33m'
VERDE='\033[1;32m'
Null='\033[0m'
NegroBg='\033[40m'
BlancoBg='\033[47m'
ROJO='\033[1;31m'
Parpadeo='\033[5m'
NEGRO='\033[1;30m'

# Comprobar si se está ejecutando como root
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, ejecuta este script como root o con sudo."
  exit 1
fi

# Variables de configuración
LANGUAGE_CODE="es_ES.UTF-8"
LANGUAGE_PRIORITY="es_ES:es"
LOCALE_FILE="/etc/default/locale"

# Configurar el archivo /etc/default/locale
echo "Configurando el idioma en $LOCALE_FILE..."
cat <<EOF > "$LOCALE_FILE"
LANG=$LANGUAGE_CODE
LANGUAGE=$LANGUAGE_PRIORITY
LC_ALL=$LANGUAGE_CODE
EOF
echo "Archivo $LOCALE_FILE actualizado."

# Generar los locales
echo "Generando los locales necesarios..."
locale-gen $LANGUAGE_CODE
locale-gen es_ES
update-locale
echo ""
clear
# Verificar los cambios
echo -e "${BlancoBg}${NEGRO} Verificando la configuración actual... ${Null}"
echo -e "${BLANCO}${NegroBg}"
locale
echo -e "${Null}"
echo ""

# Mensaje final
echo -e "${ROJO}${NegroBg}${Parpadeo}   JiAyiX   ${Null}"
echo ""
echo -e "${VERDE}El idioma del sistema se ha configurado a español ($LANGUAGE_CODE)."
echo ""
read -p "Cuando finalices, reinicia el sistema para aplicar todos los cambios." basura
echo -e "${Null}"
