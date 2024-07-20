# Compress Dictionary

#hide chars
hide_input() {
    stty -echo
    trap 'stty echo' EXIT
}

while true; do
    echo "Ingrese la contraseña: "
    hide_input
    read pass
    echo
#show chars
    stty echo
    trap - EXIT

#empty?
    if [ -z "$pass" ]; then
        echo "La contraseña no puede estar vacía. Por favor, inténtelo nuevamente."
    else
        break
    fi
done

#exits word?
if ! grep -qFx "$pass" diccionario.txt; then
#save on top
    echo "$pass" | cat - diccionario.txt > diccionario_tmp.txt && mv diccionario_tmp.txt diccionario.txt
else
#move to top
    sed -i "/$pass/d" diccionario.txt
    sed -i '1i\'"$pass" diccionario.txt
fi

# Compress
zip -P "$pass" fotocompress.zip foto.jpg


#by JS
