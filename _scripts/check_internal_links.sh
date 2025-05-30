#!/bin/bash

echo "🔎 Audit des liens internes dans les fichiers HTML du dossier /test..."

cd test || { echo "❌ Dossier /test introuvable."; exit 1; }

for file in *.html; do
  echo "📄 Vérification de $file..."
  grep -oP '(?<=href=")[^"]+\.html' "$file" | while read -r link; do
    # Supprime le préfixe éventuel (./ ou /)
    clean_link=$(basename "$link")
    if [ -f "$clean_link" ]; then
      echo "  ✔️  Lien OK : $link"
    else
      echo "  ❌ Lien cassé : $link (introuvable dans /test)"
    fi
  done
done

echo "✅ Audit terminé."
