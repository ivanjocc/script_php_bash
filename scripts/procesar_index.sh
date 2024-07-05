# version 1

# #!/bin/bash

# # Archivo a procesar
# archivo="index.php"

# # Verificar si el archivo existe
# if [ ! -f "$archivo" ]; then
#   echo "El archivo $archivo no existe."
#   exit 1
# fi

# # Crear un archivo temporal para almacenar los cambios
# temp_file=$(mktemp)

# # Expresión regular para buscar cualquier etiqueta con texto adentro
# regex='(<[^>]+>)([^<]+)(<\/[^>]+>)'

# # Leer el archivo línea por línea
# while IFS= read -r linea; do
#   # Buscar cualquier etiqueta con texto adentro
#   if [[ $linea =~ $regex ]]; then
#     etiqueta_inicio=${BASH_REMATCH[1]}
#     contenido=${BASH_REMATCH[2]}
#     etiqueta_fin=${BASH_REMATCH[3]}
#     # Verificar si el contenido ya está en el formato deseado
#     if [[ $linea != *"<?= __(\"$contenido\") ?>"* ]]; then
#       # Reemplazar el contenido con el formato deseado
#       nueva_linea="${etiqueta_inicio}<?= __(\"$contenido\") ?>${etiqueta_fin}"
#       linea=${linea//"$etiqueta_inicio$contenido$etiqueta_fin"/$nueva_linea}
#     fi
#   fi
#   # Escribir la línea (modificada o no) al archivo temporal
#   echo "$linea" >> "$temp_file"
# done < "$archivo"

# # Reemplazar el archivo original con el archivo temporal
# mv "$temp_file" "$archivo"

# echo "El archivo $archivo ha sido procesado."


# version 2

# #!/bin/bash

# # Archivo a procesar
# archivo="index.php"

# # Verificar si el archivo existe
# if [ ! -f "$archivo" ]; then
#   echo "El archivo $archivo no existe."
#   exit 1
# fi

# # Crear un archivo temporal para almacenar los cambios
# temp_file=$(mktemp)

# # Expresión regular para buscar cualquier etiqueta con texto adentro, incluyendo saltos de línea
# regex='(<[^>]+>)([^<]+)(<\/[^>]+>)'

# # Leer el archivo completo en una variable
# contenido=$(cat "$archivo")

# # Usar la opción multilinea de perl para manejar contenido con saltos de línea
# contenido_modificado=$(echo "$contenido" | perl -0777 -pe "s/$regex/\1<?= __(\"\2\") ?>\3/g")

# # Eliminar espacios adicionales alrededor del contenido
# contenido_modificado=$(echo "$contenido_modificado" | sed -E 's/(<[^>]+>)\s*(<\?= __\(".*"\) \?>)\s*(<\/[^>]+>)/\1\2\3/g')

# # Escribir el contenido modificado al archivo temporal
# echo "$contenido_modificado" > "$temp_file"

# # Reemplazar el archivo original con el archivo temporal
# mv "$temp_file" "$archivo"

# echo "El archivo $archivo ha sido procesado."


# version 3
#!/bin/bash

# Archivo a procesar
# archivo="index.php"

# # Verificar si el archivo existe
# if [ ! -f "$archivo" ]; then
#   echo "El archivo $archivo no existe."
#   exit 1
# fi

# # Crear un archivo temporal para almacenar los cambios
# temp_file=$(mktemp)

# # Expresión regular para buscar cualquier etiqueta con texto adentro, incluyendo saltos de línea
# regex='(<[^>]+>)([^<]+)(<\/[^>]+>)'

# # Leer el archivo completo en una variable
# contenido=$(cat "$archivo")

# # Usar la opción multilinea de perl para manejar contenido con saltos de línea
# contenido_modificado=$(echo "$contenido" | perl -0777 -pe "s/$regex/\1<?= __(\"\2\") ?>\3/g")

# # Escribir el contenido modificado al archivo temporal
# echo "$contenido_modificado" > "$temp_file"

# # Reemplazar el archivo original con el archivo temporal
# mv "$temp_file" "$archivo"

# echo "El archivo $archivo ha sido procesado."


# version 4 just 1 row

# #!/bin/bash

# # Archivo a procesar
# archivo="index.php"

# # Verificar si el archivo existe
# if [ ! -f "$archivo" ]; then
#   echo "El archivo $archivo no existe."
#   exit 1
# fi

# # Crear un archivo temporal para almacenar los cambios
# temp_file=$(mktemp)

# # Expresión regular para buscar cualquier etiqueta con texto adentro
# regex='(<[^>]+>)([^<]+)(<\/[^>]+>)'

# # Leer el archivo línea por línea
# while IFS= read -r linea; do
#   # Buscar cualquier etiqueta con texto adentro
#   while [[ $linea =~ $regex ]]; do
#     etiqueta_inicio=${BASH_REMATCH[1]}
#     contenido=${BASH_REMATCH[2]}
#     etiqueta_fin=${BASH_REMATCH[3]}
#     # Verificar si el contenido ya está en el formato deseado
# 	if ! grep -q "\<<?= __\(\"$contenido\"\) \?>" <<< "$linea"; then
# 	# Reemplazar el contenido con el formato deseado
# 	nueva_linea="${etiqueta_inicio}<?= __(\"$contenido\") ?>${etiqueta_fin}"
# 	linea=${linea//$etiqueta_inicio$contenido$etiqueta_fin/$nueva_linea}
# 	fi

#   done
#   # Escribir la línea (modificada o no) al archivo temporal
#   echo "$linea" >> "$temp_file"
# done < "$archivo"

# # Reemplazar el archivo original con el archivo temporal
# mv "$temp_file" "$archivo"

# echo "El archivo $archivo ha sido procesado."


# version 5 with components and index
#!/bin/bash

# Files to process
files=("index.php" "../components/header.php" "../components/footer.php")

# Regular expression to search for any tag with text inside
regex='(<[^>]+>)([^<]+)(<\/[^>]+>)'

# Process each file
for file in "${files[@]}"; do
  # Check if the file exists
  if [ ! -f "$file" ]; then
    echo "The file $file does not exist."
    continue
  fi

  # Create a temporary file to store changes
  temp_file=$(mktemp)

  # Read the file line by line
  while IFS= read -r line; do
    # Search for any tag with text inside
    while [[ $line =~ $regex ]]; do
      tag_start=${BASH_REMATCH[1]}
      content=${BASH_REMATCH[2]}
      tag_end=${BASH_REMATCH[3]}
      # Check if the content is already in the desired format
      if ! grep -q "\<<?= __\(\"$content\"\) \?>" <<< "$line"; then
        # Replace the content with the desired format
        new_line="${tag_start}<?= __(\"$content\") ?>${tag_end}"
        line=${line//$tag_start$content$tag_end/$new_line}
      fi
    done
    # Write the line (modified or not) to the temporary file
    echo "$line" >> "$temp_file"
  done < "$file"

  # Replace the original file with the temporary file
  mv "$temp_file" "$file"

  echo "The file $file has been processed."
done
