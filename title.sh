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

# Expresión regular para buscar la etiqueta <title> con texto adentro
regex='(<title>)([^<]+)(<\/title>)'

# Leer el archivo línea por línea
while IFS= read -r linea; do
  # Buscar la etiqueta <title> con texto adentro
  if [[ $linea =~ $regex ]]; then
    etiqueta_inicio=${BASH_REMATCH[1]}
    contenido=${BASH_REMATCH[2]}
    etiqueta_fin=${BASH_REMATCH[3]}
    # Verificar si el contenido ya está en el formato deseado
    if ! grep -q "\<<?= __\(\"$contenido\"\) \?>" <<< "$linea"; then
      # Reemplazar el contenido con el formato deseado
      nueva_linea="${etiqueta_inicio}<?= __(\"$contenido\") ?>${etiqueta_fin}"
      linea=${linea//$etiqueta_inicio$contenido$etiqueta_fin/$nueva_linea}
    fi
  fi
  # Escribir la línea (modificada o no) al archivo temporal
  echo "$linea" >> "$temp_file"
done < "$archivo"

# Reemplazar el archivo original con el archivo temporal
mv "$temp_file" "$archivo"

echo "El archivo $archivo ha sido procesado."
