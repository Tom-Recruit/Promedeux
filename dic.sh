# dictionary decipher


pass=$(fcrackzip -D -p diccionario.txt -u -v fotocompress.zip | grep "PASSWORD FOUND!" | cut -d ' ' -f 5)

###box
show_box() {
    local text="$1"
    local length=${#text}
    local width=$((7 + length))
    local padding=$(( ($width - ${#text} - 4) / 2 ))
    local border=$(printf "%${width}s" | tr ' ' '*')

    echo -e "\t\t\t\t""$border"
    printf "\t\t\t\t\t""*%*s%*s*\n" $padding "$text" $padding ""
    echo -e "\t\t\t\t""$border"
}

show_box "$(tput setaf 5)Contraseña: $pass$(tput sgr0)"

rm fotocompress.zip

exit 0

#by JS
