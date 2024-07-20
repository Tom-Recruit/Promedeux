# Pass range 2-4 char

while true; do
    read -p "Ingrese el rango de caracteres (2-4): " range
    if [[ $range =~ ^[2-4]$ ]]; then
        echo "$range" > range.txt
        break
    else
        echo "Rango inválido. Debe ser un número entre 2 y 4."
    fi
done

while true; do
    read -p "Ingrese el tipo de caracteres:
             1. Solo minúsculas
             2. Solo mayúsculas
             3. Solo números
             4. Todos los tipos: " char_type
    if [[ $char_type =~ ^[1-4]$ ]]; then
        echo "$char_type" > char_type.txt
        break
    else
        echo "Tipo de caracteres inválido. Debe ser 1, 2, 3 o 4."
    fi
done

#pass input
while true; do
    read -s -p "Ingrese la contraseña: " pass
    echo >&2

    range=$(cat range.txt)
    char_type=$(cat char_type.txt)
    case $char_type in
        1) regex='^[a-z]+$'; type="solo minúsculas";;
        2) regex='^[A-Z]+$'; type="solo mayúsculas";;
        3) regex='^[0-9]+$'; type="solo números";;
        4) regex='^[[:alnum:][:punct:]]+$'; type="todos los tipos";;
    esac

    if [[ ${#pass} -eq $range && $pass =~ $regex ]]; then
#exist word?
        if ! grep -qFx "$pass" diccionario.txt; then
#save on top
            temp=$(mktemp)
            echo "$pass" > "$temp"
            cat diccionario.txt >> "$temp"
            mv "$temp" diccionario.txt
        fi
        break
    else
        echo "Contraseña inválida. Debe tener exactamente $range caracteres, y $type." >&2
    fi
done

#compress
zip -P "$pass" fotocompress.zip foto.jpg


#by JS
