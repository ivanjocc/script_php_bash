#!/bin/bash

# File in which the values will be searched
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
