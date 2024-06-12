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
