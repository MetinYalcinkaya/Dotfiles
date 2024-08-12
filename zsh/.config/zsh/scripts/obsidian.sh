############
# Obsidian #
############

# Obsidian review
alias or="nvim $HOME/Documents/Obsidian/Main/inbox/*.md"

# Obsidian vault
alias ov="cd $HOME/Documents/Obsidian/Main/"

# Create new note with date + file name in vault
on() {
  if [ -z "$1" ]; then
    echo "Error: A file name must be set"
    return
  fi
  file_name=$(echo "$1" | tr ' ' '-')
  formatted_file_name=${file_name}_$(date "+%Y-%m-%d").md
  # formatted_file_name=${file_name}.md
  cd "/Users/metinyalcinkaya/Documents/Obsidian/Main/"
  touch "inbox/${formatted_file_name}"
  nvim "inbox/${formatted_file_name}"
}

# Processes and categorizes files from uncategorized folder
og() {
  VAULT_DIR="/Users/metinyalcinkaya/Documents/Obsidian/Main"
  SOURCE_DIR="uncategorized"
  DEST_DIR="notes"

  find "$VAULT_DIR/$SOURCE_DIR" -type f -name "*.md" | while read -r file; do
    echo "Processing $file"
    tag=$(awk '/tags:/{getline; print; exit;}' "$file" | sed -e 's/^ *- *//' -e 's/^ *//;s/ *$//')
    echo "Found tag $tag"
    if [ ! -z "$tag" ]; then
      TARGET_DIR="$VAULT_DIR/$DEST_DIR/$tag"
      mkdir -p "$TARGET_DIR"

      mv "$file" "$TARGET_DIR"
      echo "Moved $file to $TARGET_DIR"
    else
      echo "No tag found for $file"
    fi
  done
  echo "Done!"
}

