# #!/bin/bash

# # Definir el archivo a procesar
# archivo="index.php"

# # Verificar si el archivo existe
# if [ ! -f "$archivo" ]; then
#     echo "El archivo '$archivo' no existe."
#     exit 1
# fi

# # Crear un archivo temporal para almacenar el resultado
# temp_file=$(mktemp)

# # Leer el archivo línea por línea
# while IFS= read -r linea; do
#     # Usar una expresión regular para encontrar los textos
#     # que no estén ya envueltos en <?php echo __("..."); ?>
#     nueva_linea=$(echo "$linea" | sed -E 's/>([^<]*[^<\s])</><?php echo __("\1"); ?></g')
#     echo "$nueva_linea" >> "$temp_file"
# done < "$archivo"

# # Reemplazar el archivo original con el archivo temporal
# mv "$temp_file" "$archivo"

# echo "El archivo '$archivo' ha sido procesado."



# version 2

# #!/bin/bash

# # Definir el archivo a procesar
# archivo="index.php"

# # Verificar si el archivo existe
# if [ ! -f "$archivo" ]; then
#     echo "El archivo '$archivo' no existe."
#     exit 1
# fi

# # Crear un archivo temporal para almacenar el resultado
# temp_file=$(mktemp)

# # Variables para acumular líneas de texto dentro de una etiqueta
# acumulado=""
# dentro_etiqueta=false

# # Función para procesar y envolver textos
# procesar_acumulado() {
#     echo "$acumulado" | sed -E 's/>([^<]*[^<\s])</><?= __("\1") ?></g' >> "$temp_file"
# }

# # Leer el archivo línea por línea
# while IFS= read -r linea || [[ -n "$linea" ]]; do
#     if echo "$linea" | grep -q '<[^>]\+>'; then
#         dentro_etiqueta=true
#     fi

#     if $dentro_etiqueta; then
#         acumulado+="$linea"$'\n'
#     else
#         echo "$linea" >> "$temp_file"
#     fi

#     if echo "$linea" | grep -q '</[^>]\+>'; then
#         dentro_etiqueta=false
#         procesar_acumulado
#         acumulado=""
#     fi
# done < "$archivo"

# # Procesar cualquier línea acumulada restante
# if [ -n "$acumulado" ]; then
#     procesar_acumulado
# fi

# # Reemplazar el archivo original con el archivo temporal
# mv "$temp_file" "$archivo"

# echo "El archivo '$archivo' ha sido procesado."



# version 3

# #!/bin/bash

# # Definir el archivo a procesar
# archivo="index.php"

# # Verificar si el archivo existe
# if [ ! -f "$archivo" ]; then
#     echo "El archivo '$archivo' no existe."
#     exit 1
# fi

# # Crear un archivo temporal para almacenar el resultado
# temp_file=$(mktemp)

# # Variables para acumular líneas de texto dentro de una etiqueta
# acumulado=""
# dentro_etiqueta=false

# # Función para procesar y envolver textos
# procesar_acumulado() {
#     echo "$acumulado" | sed -E 's/>([^<]+)</><?= __("\1") ?></g' >> "$temp_file"
# }

# # Leer el archivo línea por línea
# while IFS= read -r linea || [[ -n "$linea" ]]; do
#     if echo "$linea" | grep -q '<[^>]\+>'; then
#         dentro_etiqueta=true
#     fi

#     if $dentro_etiqueta; then
#         acumulado+="$linea"$'\n'
#     else
#         echo "$linea" >> "$temp_file"
#     fi

#     if echo "$linea" | grep -q '</[^>]\+>'; then
#         dentro_etiqueta=false
#         procesar_acumulado
#         acumulado=""
#     fi
# done < "$archivo"

# # Procesar cualquier línea acumulada restante
# if [ -n "$acumulado" ]; then
#     procesar_acumulado
# fi

# # Reemplazar el archivo original con el archivo temporal
# mv "$temp_file" "$archivo"

# echo "El archivo '$archivo' ha sido procesado."



# version 4

# #!/bin/bash

# # Definir el archivo a procesar
# archivo="index.php"

# # Verificar si el archivo existe
# if [ ! -f "$archivo" ]; then
#     echo "El archivo '$archivo' no existe."
#     exit 1
# fi

# # Crear un archivo temporal para almacenar el resultado
# temp_file=$(mktemp)

# # Leer el archivo completo y acumularlo en una variable
# contenido=$(<"$archivo")

# # Usar sed para envolver los textos en <?= __("...") ?>
# contenido_modificado=$(echo "$contenido" | sed -E 's/>([^<]*[^<\s])</><?= __("\1") ?></g')

# # Escribir el contenido modificado en el archivo temporal
# echo "$contenido_modificado" > "$temp_file"

# # Reemplazar el archivo original con el archivo temporal
# mv "$temp_file" "$archivo"

# echo "El archivo '$archivo' ha sido procesado."



# version 5

# #!/bin/bash

# file_path="index.php"

# if [[ ! -f $file_path ]]; then
#   echo "El archivo $file_path no existe."
#   exit 1
# fi

# temp_file=$(mktemp)

# while IFS= read -r line; do
#   if [[ $line =~ \<[^\?]*$ ]]; then
#     line=$(echo "$line" | sed -E 's/>([^<]+)</><?= __(" \1 ") ?></g')
#   fi
#   echo "$line" >> "$temp_file"
# done < "$file_path"

# mv "$temp_file" "$file_path"

# echo "El archivo ha sido modificado correctamente."


# version 6

#!/bin/bash

file_path="index.php"

if [[ ! -f $file_path ]]; then
  echo "El archivo $file_path no existe."
  exit 1
fi

temp_file=$(mktemp)

while IFS= read -r line; do
  # Envolver textos dentro de etiquetas HTML y que no estén ya envueltos en <?= __(" ... ") ?>
  line=$(echo "$line" | sed -E 's/>([^<]+)</><?= __(" \1 ") ?></g')
  
  # Envolver textos fuertes (strong) y otros textos en líneas separadas
  line=$(echo "$line" | sed -E 's/<strong>([^<]+)<\/strong>/<?= __(" \1 ") ?>/g')
  line=$(echo "$line" | sed -E 's/>([^<]+)$/><?= __(" \1 ") ?>/g')
  
  # Eliminar espacios adicionales después de abrir <?= y antes de cerrar ?>
  line=$(echo "$line" | sed -E 's/\>\?\=\ __\(\"\ ([^"]*)\ \"\)\ \<\>/\>\?\=\ __\(\\"\1\\"\)\? \>\<\>/g')

  echo "$line" >> "$temp_file"
done < "$file_path"

mv "$temp_file" "$file_path"

echo "El archivo ha sido modificado correctamente."
