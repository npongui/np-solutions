#!/bin/bash

echo "🔧 Correction de la casse des noms de fichiers et des liens..."

# Étape 1 : Renommage des fichiers HTML
declare -A FILES_TO_RENAME=(
  ["Apropos.html"]="apropos.html"
  ["References.html"]="references.html"
  ["Contact.html"]="contact.html"
)

for OLD_NAME in "${!FILES_TO_RENAME[@]}"; do
  NEW_NAME="${FILES_TO_RENAME[$OLD_NAME]}"
  if [ -f "test/$OLD_NAME" ]; then
    mv "test/$OLD_NAME" "test/$NEW_NAME"
    echo "✅ Fichier renommé : $OLD_NAME -> $NEW_NAME"
  fi
done

# Étape 2 : Mise à jour des liens internes dans tous les fichiers HTML
FILES=$(find test -type f -name "*.html")
for FILE in $FILES; do
  sed -i 's/Apropos.html/apropos.html/g' "$FILE"
  sed -i 's/References.html/references.html/g' "$FILE"
  sed -i 's/Contact.html/contact.html/g' "$FILE"
done

echo "🔁 Mise à jour des liens internes terminée."

# Étape 3 : Git add/commit/push
git add test/*.html
git commit -m "Correction de la casse des noms de fichiers et des liens internes"
git push origin main

echo "🚀 Modifications poussées sur GitHub."
