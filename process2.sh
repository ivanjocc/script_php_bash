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
    # Buscar etiquetas HTML específicas con contenido multilinea, con o sin atributos
    if [[ "$linea" =~ ^([[:space:]]*)\<(p|span|div|strong|button|label|option)([[:space:]]+[^>]*)?\>([[:space:]]*)$ ]]; then
      # Guardar la sangría antes y después de la etiqueta HTML
      sangria_antes="${BASH_REMATCH[1]}"
      etiqueta="${BASH_REMATCH[2]}"
      atributos="${BASH_REMATCH[3]}"
      sangria_despues="${BASH_REMATCH[4]}"
      # Leer el contenido de la etiqueta HTML
      contenido=""
      while IFS= read -r linea; do
        if [[ "$linea" =~ ^[[:space:]]*\<\/$etiqueta\>[[:space:]]*$ ]]; then
          break
        fi
        contenido+="$linea\n"
      done
      contenido=$(echo -e "$contenido" | sed 's/^[[:space:]]*//') # Eliminar espacios en blanco al principio de cada línea del contenido

      # Caso especial para etiquetas <a>
      if [[ "$etiqueta" == "a" ]]; then
        contenido=$(echo -e "$contenido" | sed ':a;N;$!ba;s/\n//g') # Eliminar todos los saltos de línea del contenido
        nueva_etiqueta="${sangria_antes}<$etiqueta${atributos}><?= __(\"$contenido\") ?></$etiqueta>${sangria_despues}"
      else
        # Procesar cada línea individualmente para etiquetas que no sean <a>
        contenido_procesado=""
        while IFS= read -r sublinea; do
          sublinea=$(echo "$sublinea" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//') # Eliminar espacios al principio y al final
          contenido_procesado+="<?= __(\"$sublinea\") ?>"
        done <<< "$(echo -e "$contenido")"
        # Reemplazar el contenido con el formato deseado, manteniendo la sangría
        nueva_etiqueta="${sangria_antes}<$etiqueta${atributos}>${contenido_procesado}</$etiqueta>${sangria_despues}"
      fi
      # Escribir la nueva etiqueta al archivo temporal
      echo -ne "$nueva_etiqueta\n" >> "$temp_file"
      modificado=1
      continue
    fi
    # Escribir la línea original al archivo temporal si no se ha modificado
    echo -ne "$linea\n" >> "$temp_file"
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
