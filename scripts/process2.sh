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

# # Bandera para indicar si se ha realizado alguna modificación
# modificado=0

# # Leer el archivo línea por línea
# while IFS= read -r linea; do
#   # Buscar etiquetas <p> con contenido multilinea
#   if [[ "$linea" =~ ^[[:space:]]*\<p\>[[:space:]]*$ ]]; then
#     # Leer el contenido de la etiqueta <p>
#     contenido=""
#     while IFS= read -r linea; do
#       if [[ "$linea" =~ ^[[:space:]]*\<\/p\>[[:space:]]*$ ]]; then
#         break
#       fi
#       contenido+="$linea\n"
#     done
#     contenido=$(echo -e "$contenido" | sed 's/^[[:space:]]*//') # Eliminar espacios en blanco al principio de cada línea
#     # Verificar si el contenido ya está en el formato deseado
#     if ! grep -q "\<<?= __\(\"$contenido\"\) \?>" <<< "$linea"; then
#       # Reemplazar el contenido con el formato deseado
#       linea="<p><?= __(\"$contenido\") ?></p>"
#       modificado=1
#     fi
#   fi
#   # Escribir la línea al archivo temporal
#   echo -ne "$linea\n" >> "$temp_file"
# done < "$archivo"

# # Si se realizó alguna modificación, reemplazar el archivo original con el archivo temporal
# if [ "$modificado" -eq 1 ]; then
#   mv "$temp_file" "$archivo"
#   echo "El archivo $archivo ha sido procesado."
# else
#   rm "$temp_file"
#   echo "No se encontraron etiquetas <p> con contenido multilinea para procesar en el archivo $archivo."
# fi


# version final find p tags

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

# # Bandera para indicar si se ha realizado alguna modificación
# modificado=0

# # Leer el archivo línea por línea
# while IFS= read -r linea; do
#   # Buscar etiquetas <p> con contenido multilinea
#   if [[ "$linea" =~ ^([[:space:]]*)\<p\>([[:space:]]*)$ ]]; then
#     # Guardar la sangría antes y después de la etiqueta <p>
#     sangria_antes="${BASH_REMATCH[1]}"
#     sangria_despues="${BASH_REMATCH[2]}"
#     # Leer el contenido de la etiqueta <p>
#     contenido=""
#     while IFS= read -r linea; do
#       if [[ "$linea" =~ ^[[:space:]]*\<\/p\>[[:space:]]*$ ]]; then
#         break
#       fi
#       contenido+="$linea\n"
#     done
#     contenido=$(echo -e "$contenido" | sed 's/^[[:space:]]*//') # Eliminar espacios en blanco al principio de cada línea del contenido
#     # Verificar si el contenido ya está en el formato deseado
#     if ! grep -q "\<<?= __\(\"$contenido\"\) \?>" <<< "$linea"; then
#       # Reemplazar el contenido con el formato deseado, manteniendo la sangría
#       linea="${sangria_antes}<p><?= __(\"$contenido\") ?></p>${sangria_despues}"
#       modificado=1
#     fi
#   fi
#   # Escribir la línea al archivo temporal
#   echo -ne "$linea\n" >> "$temp_file"
# done < "$archivo"

# # Si se realizó alguna modificación, reemplazar el archivo original con el archivo temporal
# if [ "$modificado" -eq 1 ]; then
#   mv "$temp_file" "$archivo"
#   echo "El archivo $archivo ha sido procesado."
# else
#   rm "$temp_file"
#   echo "No se encontraron etiquetas <p> con contenido multilinea para procesar en el archivo $archivo."
# fi


# version 3 for the p a li span div strong button

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

# # Bandera para indicar si se ha realizado alguna modificación
# modificado=0

# # Leer el archivo línea por línea
# while IFS= read -r linea; do
#   # Buscar etiquetas HTML con contenido multilinea
#   if [[ "$linea" =~ ^([[:space:]]*)\<(p|a|li|span|div|strong|button)\>([[:space:]]*)$ ]]; then
#     # Guardar la sangría antes y después de la etiqueta HTML
#     sangria_antes="${BASH_REMATCH[1]}"
#     etiqueta="${BASH_REMATCH[2]}"
#     sangria_despues="${BASH_REMATCH[3]}"
#     # Leer el contenido de la etiqueta HTML
#     contenido=""
#     while IFS= read -r linea; do
#       if [[ "$linea" =~ ^[[:space:]]*\<\/$etiqueta\>[[:space:]]*$ ]]; then
#         break
#       fi
#       contenido+="$linea\n"
#     done
#     contenido=$(echo -e "$contenido" | sed 's/^[[:space:]]*//') # Eliminar espacios en blanco al principio de cada línea del contenido
#     # Reemplazar el contenido con el formato deseado, manteniendo la sangría
#     nueva_etiqueta="${sangria_antes}<$etiqueta><?= __(\"$contenido\") ?></$etiqueta>${sangria_despues}"
#     # Escribir la nueva etiqueta al archivo temporal
#     echo -ne "$nueva_etiqueta\n" >> "$temp_file"
#     modificado=1
#     continue
#   fi
#   # Escribir la línea original al archivo temporal si no se ha modificado
#   echo -ne "$linea\n" >> "$temp_file"
# done < "$archivo"

# # Si se realizó alguna modificación, reemplazar el archivo original con el archivo temporal
# if [ "$modificado" -eq 1 ]; then
#   mv "$temp_file" "$archivo"
#   echo "El archivo $archivo ha sido procesado."
# else
#   rm "$temp_file"
#   echo "No se encontraron etiquetas HTML con contenido multilinea para procesar en el archivo $archivo."
# fi

# version 4 for tags with atributes

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

# # Bandera para indicar si se ha realizado alguna modificación
# modificado=0

# # Leer el archivo línea por línea
# while IFS= read -r linea; do
#   # Buscar etiquetas HTML específicas con contenido multilinea, con o sin atributos
#   if [[ "$linea" =~ ^([[:space:]]*)\<(p|a|li|span|div|strong|button|label|option)([[:space:]]+[^>]*)?\>([[:space:]]*)$ ]]; then
#     # Guardar la sangría antes y después de la etiqueta HTML
#     sangria_antes="${BASH_REMATCH[1]}"
#     etiqueta="${BASH_REMATCH[2]}"
#     atributos="${BASH_REMATCH[3]}"
#     sangria_despues="${BASH_REMATCH[4]}"
#     # Leer el contenido de la etiqueta HTML
#     contenido=""
#     while IFS= read -r linea; do
#       if [[ "$linea" =~ ^[[:space:]]*\<\/$etiqueta\>[[:space:]]*$ ]]; then
#         break
#       fi
#       contenido+="$linea\n"
#     done
#     contenido=$(echo -e "$contenido" | sed 's/^[[:space:]]*//') # Eliminar espacios en blanco al principio de cada línea del contenido
#     # Reemplazar el contenido con el formato deseado, manteniendo la sangría
#     nueva_etiqueta="${sangria_antes}<$etiqueta${atributos}><?= __(\"$contenido\") ?></$etiqueta>${sangria_despues}"
#     # Escribir la nueva etiqueta al archivo temporal
#     echo -ne "$nueva_etiqueta\n" >> "$temp_file"
#     modificado=1
#     continue
#   fi
#   # Escribir la línea original al archivo temporal si no se ha modificado
#   echo -ne "$linea\n" >> "$temp_file"
# done < "$archivo"

# # Si se realizó alguna modificación, reemplazar el archivo original con el archivo temporal
# if [ "$modificado" -eq 1 ]; then
#   mv "$temp_file" "$archivo"
#   echo "El archivo $archivo ha sido procesado."
# else
#   rm "$temp_file"
#   echo "No se encontraron etiquetas HTML con contenido multilinea para procesar en el archivo $archivo."
# fi


# version 5 with components and index

# #!/bin/bash

# # Archivos a procesar
# archivos=("index.php" "components/header.php" "components/footer.php")

# # Procesar cada archivo
# for archivo in "${archivos[@]}"; do
#   # Verificar si el archivo existe
#   if [ ! -f "$archivo" ]; then
#     echo "El archivo $archivo no existe."
#     continue
#   fi

#   # Crear un archivo temporal para almacenar los cambios
#   temp_file=$(mktemp)

#   # Bandera para indicar si se ha realizado alguna modificación
#   modificado=0

#   # Leer el archivo línea por línea
#   while IFS= read -r linea; do
#     # Buscar etiquetas HTML específicas con contenido multilinea, con o sin atributos
#     if [[ "$linea" =~ ^([[:space:]]*)\<(p|a|li|span|div|strong|button|label|option)([[:space:]]+[^>]*)?\>([[:space:]]*)$ ]]; then
#       # Guardar la sangría antes y después de la etiqueta HTML
#       sangria_antes="${BASH_REMATCH[1]}"
#       etiqueta="${BASH_REMATCH[2]}"
#       atributos="${BASH_REMATCH[3]}"
#       sangria_despues="${BASH_REMATCH[4]}"
#       # Leer el contenido de la etiqueta HTML
#       contenido=""
#       while IFS= read -r linea; do
#         if [[ "$linea" =~ ^[[:space:]]*\<\/$etiqueta\>[[:space:]]*$ ]]; then
#           break
#         fi
#         contenido+="$linea\n"
#       done
#       contenido=$(echo -e "$contenido" | sed 's/^[[:space:]]*//') # Eliminar espacios en blanco al principio de cada línea del contenido
#       # Reemplazar el contenido con el formato deseado, manteniendo la sangría
#       nueva_etiqueta="${sangria_antes}<$etiqueta${atributos}><?= __(\"$contenido\") ?></$etiqueta>${sangria_despues}"
#       # Escribir la nueva etiqueta al archivo temporal
#       echo -ne "$nueva_etiqueta\n" >> "$temp_file"
#       modificado=1
#       continue
#     fi
#     # Escribir la línea original al archivo temporal si no se ha modificado
#     echo -ne "$linea\n" >> "$temp_file"
#   done < "$archivo"

#   # Si se realizó alguna modificación, reemplazar el archivo original con el archivo temporal
#   if [ "$modificado" -eq 1 ]; then
#     mv "$temp_file" "$archivo"
#     echo "El archivo $archivo ha sido procesado."
#   else
#     rm "$temp_file"
#     echo "No se encontraron etiquetas HTML con contenido multilinea para procesar en el archivo $archivo."
#   fi
# done


# version 6 for all the components but not for a tags

#!/bin/bash

# Files to process
files=("index.php" "components/header.php" "components/footer.php")

# Process each file
for file in "${files[@]}"; do
  # Check if the file exists
  if [ ! -f "$file" ]; then
    echo "The file $file does not exist."
    continue
  fi

  # Create a temporary file to store changes
  temp_file=$(mktemp)

  # Flag to indicate if any modification has been made
  modified=0

  # Read the file line by line
  while IFS= read -r line; do
    # Search for specific HTML tags with multiline content, with or without attributes
    if [[ "$line" =~ ^([[:space:]]*)\<(p|span|div|strong|button|label|option)([[:space:]]+[^>]*)?\>([[:space:]]*)$ ]]; then
      # Save the indentation before and after the HTML tag
      indent_before="${BASH_REMATCH[1]}"
      tag="${BASH_REMATCH[2]}"
      attributes="${BASH_REMATCH[3]}"
      indent_after="${BASH_REMATCH[4]}"
      # Read the content of the HTML tag
      content=""
      while IFS= read -r line; do
        if [[ "$line" =~ ^[[:space:]]*\<\/$tag\>[[:space:]]*$ ]]; then
          break
        fi
        content+="$line\n"
      done
      content=$(echo -e "$content" | sed 's/^[[:space:]]*//') # Remove leading whitespace from each line of content

      # Special case for <a> tags
      if [[ "$tag" == "a" ]]; then
        content=$(echo -e "$content" | sed ':a;N;$!ba;s/\n//g') # Remove all newlines from the content
        new_tag="${indent_before}<$tag${attributes}><?= __(\"$content\") ?></$tag>${indent_after}"
      else
        # Process each line individually for tags other than <a>
        processed_content=""
        while IFS= read -r subline; do
          subline=$(echo "$subline" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//') # Remove leading and trailing whitespace
          processed_content+="<?= __(\"$subline\") ?>"
        done <<< "$(echo -e "$content")"
        # Replace the content with the desired format, keeping the indentation
        new_tag="${indent_before}<$tag${attributes}>${processed_content}</$tag>${indent_after}"
      fi
      # Write the new tag to the temporary file
      echo -ne "$new_tag\n" >> "$temp_file"
      modified=1
      continue
    fi
    # Write the original line to the temporary file if not modified
    echo -ne "$line\n" >> "$temp_file"
  done < "$file"

  # If any modification was made, replace the original file with the temporary file
  if [ "$modified" -eq 1 ]; then
    mv "$temp_file" "$file"
    echo "The file $file has been processed."
  else
    rm "$temp_file"
    echo "No multiline HTML tags were found to process in the file $file."
  fi
done
