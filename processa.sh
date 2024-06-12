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

# Archivos a procesar
archivos=("index.php" "components/header.php" "components/footer.php")

# Procesar cada archivo
for archivo in "${archivos[@]}"; do
  # Verificar si el archivo existe
  if [ ! -f "$archivo" ]; then
    echo "El archivo $archivo no existe."
    continue
  fi

  # Crear un archivo temporal para almacenar los cambios
  temp_file=$(mktemp)

  # Bandera para indicar si se ha realizado alguna modificación
  modificado=0

  # Leer el archivo línea por línea
  while IFS= read -r linea; do
    # Procesar solo líneas dentro de <ul>...</ul>
    if [[ "$linea" =~ ^[[:space:]]*\<ul([[:space:]]+[^>]*)?\>[[:space:]]*$ ]]; then
      echo -ne "$linea\n" >> "$temp_file"
      while IFS= read -r sublinea; do
        if [[ "$sublinea" =~ ^[[:space:]]*\</ul\>[[:space:]]*$ ]]; then
          echo -ne "$sublinea\n" >> "$temp_file"
          break
        elif [[ "$sublinea" =~ ^([[:space:]]*)\<(a)([[:space:]]+[^>]*)?\>[[:space:]]*$ ]]; then
          sangria_antes="${BASH_REMATCH[1]}"
          etiqueta="${BASH_REMATCH[2]}"
          atributos="${BASH_REMATCH[3]}"
          contenido=""
          while IFS= read -r contenido_linea; do
            if [[ "$contenido_linea" =~ ^[[:space:]]*\</$etiqueta\>[[:space:]]*$ ]]; then
              break
            fi
            contenido+="$contenido_linea"
          done
          # Verificar si el contenido ya está entre <?= __("...") ?>
          if [[ ! "$contenido" =~ ^[[:space:]]*\<\?=__[[:space:]]*\".*\"[[:space:]]*\?\>[[:space:]]*$ ]]; then
            contenido="<?= __(\"$(echo $contenido | xargs)\") ?>"
            modificado=1
          fi
          echo -ne "${sangria_antes}<$etiqueta${atributos}>${contenido}</$etiqueta>\n" >> "$temp_file"
        else
          echo -ne "$sublinea\n" >> "$temp_file"
        fi
      done
    else
      echo -ne "$linea\n" >> "$temp_file"
    fi
  done < "$archivo"

  # Si se realizó alguna modificación, reemplazar el archivo original con el archivo temporal
  if [ "$modificado" -eq 1 ]; then
    mv "$temp_file" "$archivo"
    echo "El archivo $archivo ha sido procesado."
  else
    rm "$temp_file"
    echo "No se encontraron etiquetas HTML con contenido multilinea para procesar en el archivo $archivo."
  fi
done
