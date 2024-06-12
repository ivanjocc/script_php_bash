# English Version, Bash Scripts for Processing HTML Files

This repository contains four Bash scripts for processing HTML files. These scripts perform various tasks such as replacing content within HTML tags and ensuring text is wrapped in a specific format.

## Script 1: Replace `value` and `placeholder` Attributes

This script processes specified files to replace the `value` and `placeholder` attributes with the desired format, ensuring they are wrapped with `<?= __("...") ?>` unless already in this format.

### Usage

1. Save the following script to a file, e.g., `replace_attributes.sh`:

    ```bash
    #!/bin/bash

    # File to process
    FILE="index.php"

    # Create a temporary file
    TEMP_FILE=$(mktemp)

    # Replace value and placeholder with the desired structure, but do not modify those that already have <?= __("") ?>
    sed -E 's/(value|placeholder)="([^<"]*[^>])"/\1="<?= __("\2") ?>"/g' "$FILE" | sed -E 's/(value|placeholder)=("&lt;\?= __\("[^"]+"\) &gt;")/\1=\2/g' > "$TEMP_FILE"

    # Replace the original file with the temporary file
    mv "$TEMP_FILE" "$FILE"

    # Remove the temporary file
    rm -f "$TEMP_FILE"

    echo "Replacements made in $FILE"
    ```

2. Make the script executable:

    ```bash
    chmod +x replace_attributes.sh
    ```

3. Run the script:

    ```bash
    ./replace_attributes.sh
    ```

## Script 2: Replace `<title>` Tag Content

This script processes the specified file to replace the content inside the `<title>` tag with the desired format, ensuring it is wrapped with `<?= __("...") ?>` unless already in this format.

### Usage

1. Save the following script to a file, e.g., `replace_title.sh`:

    ```bash
    #!/bin/bash

    # File to process
    file="index.php"

    # Check if the file exists
    if [ ! -f "$file" ]; then
      echo "The file $file does not exist."
      exit 1
    fi

    # Create a temporary file to store changes
    temp_file=$(mktemp)

    # Regular expression to search for the <title> tag with text inside
    regex='(<title>)([^<]+)(<\/title>)'

    # Read the file line by line
    while IFS= read -r line; do
      # Search for the <title> tag with text inside
      if [[ $line =~ $regex ]]; then
        tag_start=${BASH_REMATCH[1]}
        content=${BASH_REMATCH[2]}
        tag_end=${BASH_REMATCH[3]}
        # Check if the content is already in the desired format
        if ! grep -q "\<<?= __\(\"$content\"\) \?>" <<< "$line"; then
          # Replace the content with the desired format
          new_line="${tag_start}<?= __(\"$content\") ?>${tag_end}"
          line=${line//$tag_start$content$tag_end/$new_line}
        fi
      fi
      # Write the line (modified or not) to the temporary file
      echo "$line" >> "$temp_file"
    done < "$file"

    # Replace the original file with the temporary file
    mv "$temp_file" "$file"

    echo "The file $file has been processed."
    ```

2. Make the script executable:

    ```bash
    chmod +x replace_title.sh
    ```

3. Run the script:

    ```bash
    ./replace_title.sh
    ```

## Script 3: Process `<ul>` Tags and Wrap `<a>` Tag Content

This script processes specified files to find `<a>` tags within `<ul>` tags and wrap their content with `<?= __("...") ?>`, preserving indentation and other attributes.

### Usage

1. Save the following script to a file, e.g., `process_ul_a.sh`:

    ```bash
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
    ```

2. Make the script executable:

    ```bash
    chmod +x process_ul_a.sh
    ```

3. Run the script:

    ```bash
    ./process_ul_a.sh
    ```

## Script 4: Process Multiple HTML Tags with Multiline Content

This script processes specified files to find specific HTML tags (`<p>`, `<span>`, `<div>`, `<strong>`, `<button>`, `<label>`, `<option>`) with multiline content and wrap their content with `<?= __("...") ?>`, preserving indentation and other attributes.

### Usage

1. Save the following script to a file, e.g., `process_multiline_tags.sh`:

    ```bash
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
      if [ "$modified" -eq 1]; then
        mv "$temp_file" "$file"
        echo "The file $file has been processed."
      else
        rm "$temp_file"
        echo "No multiline HTML tags were found to process in the file $file."
      fi
    done
    ```

2. Make the script executable:

    ```bash
    chmod +x process_multiline_tags.sh
    ```

3. Run the script:

    ```bash
    ./process_multiline_tags.sh
    ```

---

# Version Française, Scripts Bash pour le Traitement de Fichiers HTML

Ce dépôt contient quatre scripts Bash pour le traitement de fichiers HTML. Ces scripts effectuent diverses tâches telles que remplacer le contenu des balises HTML et s'assurer que le texte est encapsulé dans un format spécifique.

## Script 1 : Remplacer les Attributs `value` et `placeholder`

Ce script traite les fichiers spécifiés pour remplacer les attributs `value` et `placeholder` avec le format désiré, en s'assurant qu'ils sont encapsulés avec `<?= __("...") ?>` à moins qu'ils ne soient déjà dans ce format.

### Utilisation

1. Enregistrez le script suivant dans un fichier, par exemple `replace_attributes.sh` :

    ```bash
    #!/bin/bash

    # Fichier à traiter
    FILE="index.php"

    # Créer un fichier temporaire
    TEMP_FILE=$(mktemp)

    # Remplacer value et placeholder avec la structure désirée, mais ne pas modifier ceux qui ont déjà <?= __("") ?>
    sed -E 's/(value|placeholder)="([^<"]*[^>])"/\1="<?= __("\2") ?>"/g' "$FILE" | sed -E 's/(value|placeholder)=("&lt;\?= __\("[^"]+"\) &gt;")/\1=\2/g' > "$TEMP_FILE"

    # Remplacer le fichier original par le fichier temporaire
    mv "$TEMP_FILE" "$FILE"

    # Supprimer le fichier temporaire
    rm -f "$TEMP_FILE"

    echo "Remplacements effectués dans $FILE"
    ```

2. Rendez le script exécutable :

    ```bash
    chmod +x replace_attributes.sh
    ```

3. Exécutez le script :

    ```bash
    ./replace_attributes.sh
    ```

## Script 2 : Remplacer le Contenu de la Balise `<title>`

Ce script traite le fichier spécifié pour remplacer le contenu à l'intérieur de la balise `<title>` avec le format désiré, en s'assurant qu'il est encapsulé avec `<?= __("...") ?>` à moins qu'il ne soit déjà dans ce format.

### Utilisation

1. Enregistrez le script suivant dans un fichier, par exemple `replace_title.sh` :

    ```bash
    #!/bin/bash

    # Fichier à traiter
    file="index.php"

    # Vérifier si le fichier existe
    if [ ! -f "$file" ]; then
      echo "Le fichier $file n'existe pas."
      exit 1
    fi

    # Créer un fichier temporaire pour stocker les modifications
    temp_file=$(mktemp)

    # Expression régulière pour rechercher la balise <title> avec du texte à l'intérieur
    regex='(<title>)([^<]+)(<\/title>)'

    # Lire le fichier ligne par ligne
    while IFS= read -r line; do
      # Rechercher la balise <title> avec du texte à l'intérieur
      if [[ $line =~ $regex ]]; then
        tag_start=${BASH_REMATCH[1]}
        content=${BASH_REMATCH[2]}
        tag_end=${BASH_REMATCH[3]}
        # Vérifier si le contenu est déjà dans le format désiré
        if ! grep -q "\<<?= __\(\"$content\"\) \?>" <<< "$line"; then
          # Remplacer le contenu par le format désiré
          new_line="${tag_start}<?= __(\"$content\") ?>${tag_end}"
          line=${line//$tag_start$content$tag_end/$new_line}
        fi
      fi
      # Écrire la ligne (modifiée ou non) dans le fichier temporaire
      echo "$line" >> "$temp_file"
    done < "$file"

    # Remplacer le fichier original par le fichier temporaire
    mv "$temp_file" "$file"

    echo "Le fichier $file a été traité."
    ```

2. Rendez le script exécutable :

    ```bash
    chmod +x replace_title.sh
    ```

3. Exécutez le script :

    ```bash
    ./replace_title.sh
    ```

## Script 3 : Traiter les Balises `<ul>` et Encapsuler le Contenu des Balises `<a>`

Ce script traite les fichiers spécifiés pour trouver les balises `<a>` à l'intérieur des balises `<ul>` et encapsuler leur contenu avec `<?= __("...") ?>`, en préservant l'indentation et les autres attributs.

### Utilisation

1. Enregistrez le script suivant dans un fichier, par exemple `process_ul_a.sh` :

    ```bash
    #!/bin/bash

    # Fichiers à traiter
    files=("index.php" "components/header.php" "components/footer.php")

    # Traiter chaque fichier
    for file in "${files[@]}"; do
      # Vérifier si le fichier existe
      if [ ! -f "$file" ]; then
        echo "Le fichier $file n'existe pas."
        continue
      fi

      # Créer un fichier temporaire pour stocker les modifications
      temp_file=$(mktemp)

      # Drapeau pour indiquer si une modification a été effectuée
      modified=0

      # Lire le fichier ligne par ligne
      while IFS= read -r line; do
        # Traiter uniquement les lignes dans <ul>...</ul>
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
              # Vérifier si le contenu est déjà dans le format <?= __("...") ?>
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

      # Si une modification a été effectuée, remplacer le fichier original par le fichier temporaire
      if [ "$modified" -eq 1 ]; then
        mv "$temp_file" "$file"
        echo "Le fichier $file a été traité."
      else
        rm "$temp_file"
        echo "Aucune balise HTML multiligne n'a été trouvée pour être traitée dans le fichier $file."
      fi
    done
    ```

2. Rendez le script exécutable :

    ```bash
    chmod +x process_ul_a.sh
    ```

3. Exécutez le script :

    ```bash
    ./process_ul_a.sh
    ```

## Script 4 : Traiter Plusieurs Balises HTML avec Contenu Multiligne

Ce script traite les fichiers spécifiés pour trouver des balises HTML spécifiques (`<p>`, `<span>`, `<div>`, `<strong>`, `<button>`, `<label>`, `<option>`) avec du contenu multiligne et encapsuler leur contenu avec `<?= __("...") ?>`, en préservant l'indentation et les autres attributs.

### Utilisation

1. Enregistrez le script suivant dans un fichier, par exemple `process_multiline_tags.sh` :

    ```bash
    #!/bin/bash

    # Fichiers à traiter
    files=("index.php" "components/header.php" "components/footer.php")

    # Traiter chaque fichier
    for file in "${files[@]}"; do
      # Vérifier si le fichier existe
      if [ ! -f "$file" ]; alors
        echo "Le fichier $file n'existe pas."
        continuer
      fi

      # Créer un fichier temporaire pour stocker les modifications
      temp_file=$(mktemp)

      # Drapeau pour indiquer si une modification a été effectuée
      modified=0

      # Lire le fichier ligne par ligne
      while IFS= read -r line; do
        # Rechercher des balises HTML spécifiques avec du contenu multiligne, avec ou sans attributs
        if [[ "$line" =~ ^([[:space:]]*)\<(p|span|div|strong|button|label|option)([[:space:]]+[^>]*)?\>([[:space:]]*)$ ]]; alors
          # Enregistrer l'indentation avant et après la balise HTML
          indent_before="${BASH_REMATCH[1]}"
          tag="${BASH_REMATCH[2]}"
          attributes="${BASH_REMATCH[3]}"
          indent_after="${BASH_REMATCH[4]}"
          # Lire le contenu de la balise HTML
          content=""
          while IFS= read -r line; do
            if [[ "$line" =~ ^[[:space:]]*\<\/$tag\>[[:space:]]*$ ]]; alors
              break
            fi
            content+="$line\n"
          done
          content=$(echo -e "$content" | sed 's/^[[:space:]]*//') # Supprimer les espaces de début de chaque ligne de contenu

          # Cas particulier pour les balises <a>
          if [[ "$tag" == "a" ]]; alors
            content=$(echo -e "$content" | sed ':a;N;$!ba;s/\n//g') # Supprimer toutes les nouvelles lignes du contenu
            new_tag="${indent_before}<$tag${attributes}><?= __(\"$content\") ?></$tag>${indent_after}"
          else
            # Traiter chaque ligne individuellement pour les balises autres que <a>
            processed_content=""
            while IFS= read -r subline; do
              subline=$(echo "$subline" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//') # Supprimer les espaces de début et de fin
              processed_content+="<?= __(\"$subline\") ?>"
            done <<< "$(echo -e "$content")"
            # Remplacer le contenu par le format désiré, en conservant l'indentation
            new_tag="${indent_before}<$tag${attributes}>${processed_content}</$tag>${indent_after}"
          fi
          # Écrire la nouvelle balise dans le fichier temporaire
          echo -ne "$new_tag\n" >> "$temp_file"
          modified=1
          continue
        fi
        # Écrire la ligne originale dans le fichier temporaire si elle n'a pas été modifiée
        echo -ne "$line\n" >> "$temp_file"
      done < "$file"

      # Si une modification a été effectuée, remplacer le fichier original par le fichier temporaire
      if [ "$modified" -eq 1 ]; alors
        mv "$temp_file" "$file"
        echo "Le fichier $file a été traité."
      else
        rm "$temp_file"
        echo "Aucune balise HTML multiligne n'a été trouvée pour être traitée dans le fichier $file."
      fi
    done
    ```

2. Rendez le script exécutable :

    ```bash
    chmod +x process_multiline_tags.sh
    ```

3. Exécutez le script :

    ```bash
    ./process_multiline_tags.sh
    ```

___

# Version Español, Scripts Bash para el Tratamiento de Archivos HTML

Este repositorio contiene cuatro scripts Bash para el tratamiento de archivos HTML. Estos scripts realizan diversas tareas como reemplazar contenido dentro de las etiquetas HTML y asegurar que el texto esté encapsulado en un formato específico.

## Script 1: Reemplazar los Atributos `value` y `placeholder`

Este script procesa los archivos especificados para reemplazar los atributos `value` y `placeholder` con el formato deseado, asegurándose de que estén encapsulados con `<?= __("...") ?>` a menos que ya estén en este formato.

### Uso

1. Guarda el siguiente script en un archivo, por ejemplo, `replace_attributes.sh`:

    ```bash
    #!/bin/bash

    # Archivo a procesar
    FILE="index.php"

    # Crear un archivo temporal
    TEMP_FILE=$(mktemp)

    # Reemplazar value y placeholder con la estructura deseada, pero no modificar aquellos que ya tengan <?= __("") ?>
    sed -E 's/(value|placeholder)="([^<"]*[^>])"/\1="<?= __("\2") ?>"/g' "$FILE" | sed -E 's/(value|placeholder)=("&lt;\?= __\("[^"]+"\) &gt;")/\1=\2/g' > "$TEMP_FILE"

    # Reemplazar el archivo original con el archivo temporal
    mv "$TEMP_FILE" "$FILE"

    # Eliminar el archivo temporal
    rm -f "$TEMP_FILE"

    echo "Reemplazos realizados en $FILE"
    ```

2. Haz que el script sea ejecutable:

    ```bash
    chmod +x replace_attributes.sh
    ```

3. Ejecuta el script:

    ```bash
    ./replace_attributes.sh
    ```

## Script 2: Reemplazar el Contenido de la Etiqueta `<title>`

Este script procesa el archivo especificado para reemplazar el contenido dentro de la etiqueta `<title>` con el formato deseado, asegurándose de que esté encapsulado con `<?= __("...") ?>` a menos que ya esté en este formato.

### Uso

1. Guarda el siguiente script en un archivo, por ejemplo, `replace_title.sh`:

    ```bash
    #!/bin/bash

    # Archivo a procesar
    file="index.php"

    # Verificar si el archivo existe
    if [ ! -f "$file" ]; then
      echo "El archivo $file no existe."
      exit 1
    fi

    # Crear un archivo temporal para almacenar los cambios
    temp_file=$(mktemp)

    # Expresión regular para buscar la etiqueta <title> con texto adentro
    regex='(<title>)([^<]+)(<\/title>)'

    # Leer el archivo línea por línea
    while IFS= read -r line; do
      # Buscar la etiqueta <title> con texto adentro
      if [[ $line =~ $regex ]]; then
        tag_start=${BASH_REMATCH[1]}
        content=${BASH_REMATCH[2]}
        tag_end=${BASH_REMATCH[3]}
        # Verificar si el contenido ya está en el formato deseado
        if ! grep -q "\<<?= __\(\"$content\"\) \?>" <<< "$line"; then
          # Reemplazar el contenido con el formato deseado
          new_line="${tag_start}<?= __(\"$content\") ?>${tag_end}"
          line=${line//$tag_start$content$tag_end/$new_line}
        fi
      fi
      # Escribir la línea (modificada o no) al archivo temporal
      echo "$line" >> "$temp_file"
    done < "$file"

    # Reemplazar el archivo original con el archivo temporal
    mv "$temp_file" "$file"

    echo "El archivo $file ha sido procesado."
    ```

2. Haz que el script sea ejecutable:

    ```bash
    chmod +x replace_title.sh
    ```

3. Ejecuta el script:

    ```bash
    ./replace_title.sh
    ```

## Script 3: Procesar las Etiquetas `<ul>` y Encapsular el Contenido de las Etiquetas `<a>`

Este script procesa los archivos especificados para encontrar las etiquetas `<a>` dentro de las etiquetas `<ul>` y encapsular su contenido con `<?= __("...") ?>`, preservando la indentación y otros atributos.

### Uso

1. Guarda el siguiente script en un archivo, por ejemplo, `process_ul_a.sh`:

    ```bash
    #!/bin/bash

    # Archivos a procesar
    files=("index.php" "components/header.php" "components/footer.php")

    # Procesar cada archivo
    for file in "${files[@]}"; do
      # Verificar si el archivo existe
      if [ ! -f "$file" ]; then
        echo "El archivo $file no existe."
        continue
      fi

      # Crear un archivo temporal para almacenar los cambios
      temp_file=$(mktemp)

      # Bandera para indicar si se ha realizado alguna modificación
      modified=0

      # Leer el archivo línea por línea
      while IFS= read -r line; do
        # Procesar solo líneas dentro de <ul>...</ul>
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
              # Verificar si el contenido ya está en el formato <?= __("...") ?>
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

      # Si se realizó alguna modificación, reemplazar el archivo original con el archivo temporal
      if [ "$modified" -eq 1 ]; then
        mv "$temp_file" "$file"
        echo "El archivo $file ha sido procesado."
      else
        rm "$temp_file"
        echo "No se encontraron etiquetas HTML con contenido multilinea para procesar en el archivo $file."
      fi
    done
    ```

2. Haz que el script sea ejecutable:

    ```bash
    chmod +x process_ul_a.sh
    ```

3. Ejecuta el script:

    ```bash
    ./process_ul_a.sh
    ```

## Script 4: Procesar Múltiples Etiquetas HTML con Contenido Multilinea

Este script procesa los archivos especificados para encontrar etiquetas HTML específicas (`<p>`, `<span>`, `<div>`, `<strong>`, `<button>`, `<label>`, `<option>`) con contenido multilinea y encapsular su contenido con `<?= __("...") ?>`, preservando la indentación y otros atributos.

### Uso

1. Guarda el siguiente script en un archivo, por ejemplo, `process_multiline_tags.sh`:

    ```bash
    #!/bin/bash

    # Archivos a procesar
    files=("index.php" "components/header.php" "components/footer.php")

    # Procesar cada archivo
    for file in "${files[@]}"; do
      # Verificar si el archivo existe
      if [ ! -f "$file" ]; entonces
        echo "El archivo $file no existe."
        continuar
      fi

      # Crear un archivo temporal para almacenar los cambios
      temp_file=$(mktemp)

      # Bandera para indicar si se ha realizado alguna modificación
      modified=0

      # Leer el archivo línea por línea
      mientras IFS= read -r line; do
        # Buscar etiquetas HTML específicas con contenido multilinea, con o sin atributos
        if [[ "$line" =~ ^([[:space:]]*)\<(p|span|div|strong|button|label|option)([[:space:]]+[^>]*)?\>([[:space:]]*)$ ]]; entonces
          # Guardar la indentación antes y después de la etiqueta HTML
          indent_before="${BASH_REMATCH[1]}"
          tag="${BASH_REMATCH[2]}"
          attributes="${BASH_REMATCH[3]}"
          indent_after="${BASH_REMATCH[4]}"
          # Leer el contenido de la etiqueta HTML
          content=""
          mientras IFS= read -r line; do
            if [[ "$line" =~ ^[[:space:]]*\<\/$tag\>[[:space:]]*$ ]]; entonces
              romper
            fi
            content+="$line\n"
          hecho
          content=$(echo -e "$content" | sed 's/^[[:space:]]*//') # Eliminar espacios en blanco al inicio de cada línea de contenido

          # Caso especial para etiquetas <a>
          if [[ "$tag" == "a" ]]; entonces
            content=$(echo -e "$content" | sed ':a;N;$!ba;s/\n//g') # Eliminar todas las líneas nuevas del contenido
            new_tag="${indent_before}<$tag${attributes}><?= __(\"$content\") ?></$tag>${indent_after}"
          else
            # Procesar cada línea individualmente para etiquetas que no sean <a>
            processed_content=""
            mientras IFS= read -r subline; do
              subline=$(echo "$subline" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//') # Eliminar espacios al inicio y al final
              processed_content+="<?= __(\"$subline\") ?>"
            hecho <<< "$(echo -e "$content")"
            # Reemplazar el contenido con el formato deseado, manteniendo la indentación
            new_tag="${indent_before}<$tag${attributes}>${processed_content}</$tag>${indent_after}"
          fi
          # Escribir la nueva etiqueta al archivo temporal
          echo -ne "$new_tag\n" >> "$temp_file"
          modified=1
          continuar
        fi
        # Escribir la línea original al archivo temporal si no se ha modificado
        echo -ne "$line\n" >> "$temp_file"
      hecho < "$file"

      # Si se realizó alguna modificación, reemplazar el archivo original con el archivo temporal
      if [ "$modified" -eq 1 ]; entonces
        mv "$temp_file" "$file"
        echo "El archivo $file ha sido procesado."
      else
        rm "$temp_file"
        echo "No se encontraron etiquetas HTML con contenido multilinea para procesar en el archivo $file."
      fi
    hecho
    ```

2. Haz que el script sea ejecutable:

    ```bash
    chmod +x process_multiline_tags.sh
    ```

3. Ejecuta el script:

    ```bash
    ./process_multiline_tags.sh
    ```

