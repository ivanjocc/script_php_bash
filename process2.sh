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

#!/bin/bash

# Archivo a procesar
archivo="index.php"

# Verificar si el archivo existe
if [ ! -f "$archivo" ]; then
  echo "El archivo $archivo no existe."
  exit 1
fi

# Crear un archivo temporal para almacenar los cambios
temp_file=$(mktemp)

# Bandera para indicar si se ha realizado alguna modificación
modificado=0

# Leer el archivo línea por línea
while IFS= read -r linea; do
  # Buscar etiquetas HTML específicas con contenido multilinea, con o sin atributos
  if [[ "$linea" =~ ^([[:space:]]*)\<(p|a|li|span|div|strong|button)([[:space:]]+[^>]*)?\>([[:space:]]*)$ ]]; then
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
    # Reemplazar el contenido con el formato deseado, manteniendo la sangría
    nueva_etiqueta="${sangria_antes}<$etiqueta${atributos}><?= __(\"$contenido\") ?></$etiqueta>${sangria_despues}"
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
