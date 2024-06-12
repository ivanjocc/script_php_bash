# version 1
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
#     # Procesar solo líneas dentro de <ul>...</ul>
#     if [[ "$linea" =~ ^[[:space:]]*\<ul([[:space:]]+[^>]*)?\>[[:space:]]*$ ]]; then
#       echo -ne "$linea\n" >> "$temp_file"
#       while IFS= read -r sublinea; do
#         if [[ "$sublinea" =~ ^[[:space:]]*\</ul\>[[:space:]]*$ ]]; then
#           echo -ne "$sublinea\n" >> "$temp_file"
#           break
#         elif [[ "$sublinea" =~ ^([[:space:]]*)\<a([[:space:]]+[^>]*)?\>([^<]*)\<\/a\>([[:space:]]*)$ ]]; then
#           sangria_antes="${BASH_REMATCH[1]}"
#           atributos="${BASH_REMATCH[2]}"
#           contenido="${BASH_REMATCH[3]}"
#           sangria_despues="${BASH_REMATCH[4]}"
#           # Verificar si el contenido ya está entre <?= __("...") ?>
#           if [[ ! "$contenido" =~ ^\<\?=__[[:space:]]*\".*\"[[:space:]]*\?\>$ ]]; then
#             contenido="<?= __(\"$contenido\") ?>"
#             modificado=1
#           fi
#           echo -ne "${sangria_antes}<$etiqueta${atributos}>${contenido}</$etiqueta>${sangria_despues}\n" >> "$temp_file"
#         elif [[ "$sublinea" =~ ^([[:space:]]*)\<span([[:space:]]+[^>]*)?\>([^<]*)\<\/span\>([[:space:]]*)$ ]]; then
#           sangria_antes="${BASH_REMATCH[1]}"
#           atributos="${BASH_REMATCH[2]}"
#           contenido="${BASH_REMATCH[3]}"
#           sangria_despues="${BASH_REMATCH[4]}"
#           if [[ ! "$contenido" =~ ^\<\?=__[[:space:]]*\".*\"[[:space:]]*\?\>$ ]]; then
#             contenido="<?= __(\"$contenido\") ?>"
#             modificado=1
#           fi
#           echo -ne "${sangria_antes}<$etiqueta${atributos}>${contenido}</$etiqueta>${sangria_despues}\n" >> "$temp_file"
#         elif [[ "$sublinea" =~ ^([[:space:]]*)\<li([[:space:]]+[^>]*)?\>([^<]*)\<\/li\>([[:space:]]*)$ ]]; then
#           sangria_antes="${BASH_REMATCH[1]}"
#           atributos="${BASH_REMATCH[2]}"
#           contenido="${BASH_REMATCH[3]}"
#           sangria_despues="${BASH_REMATCH[4]}"
#           if [[ ! "$contenido" =~ ^\<\?=__[[:space:]]*\".*\"[[:space:]]*\?\>$ ]]; then
#             contenido="<?= __(\"$contenido\") ?>"
#             modificado=1
#           fi
#           echo -ne "${sangria_antes}<$etiqueta${atributos}>${contenido}</$etiqueta>${sangria_despues}\n" >> "$temp_file"
#         else
#           echo -ne "$sublinea\n" >> "$temp_file"
#         fi
#       done
#     else
#       echo -ne "$linea\n" >> "$temp_file"
#     fi
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


# version 2

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
    # Process only lines within <ul>...</ul>
    if [[ "$line" =~ ^[[:space:]]*\<ul([[:space:]]+[^>]*)?\>[[:space:]]*$ ]]; then
      echo -ne "$line\n" >> "$temp_file"
      while IFS= read -r subline; do
        if [[ "$subline" =~ ^[[:space:]]*\</ul\>[[:space:]]*$ ]]; then
          echo -ne "$subline\n" >> "$temp_file"
          break
        elif [[ "$subline" =~ ^([[:space:]]*)\<(a)([[:space:]]+[^>]*)?\>[[:space:]]*$ ]]; then
          indent_before="${BASH_REMATCH[1]}"
          tag="${BASH_REMATCH[2]}"
          attributes="${BASH_REMATCH[3]}"
          content=""
          while IFS= read -r content_line; do
            if [[ "$content_line" =~ ^[[:space:]]*\</$tag\>[[:space:]]*$ ]]; then
              break
            fi
            content+="$content_line"
          done
          # Check if the content is already in the format <?= __("...") ?>
          if [[ ! "$content" =~ ^[[:space:]]*\<\?=__[[:space:]]*\".*\"[[:space:]]*\?\>[[:space:]]*$ ]]; then
            content="<?= __(\"$(echo $content | xargs)\") ?>"
            modified=1
          fi
          echo -ne "${indent_before}<$tag${attributes}>${content}</$tag>\n" >> "$temp_file"
        else
          echo -ne "$subline\n" >> "$temp_file"
        fi
      done
    else
      echo -ne "$line\n" >> "$temp_file"
    fi
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
