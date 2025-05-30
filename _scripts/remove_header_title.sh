#!/bin/bash
echo "🔧 Suppression du <h1>NP-SOLUTIONS</h1> dans toutes les pages HTML du dossier /test..."

for file in test/*.html; do
  # Supprimer uniquement la ligne contenant <h1>NP-SOLUTIONS</h1>
  sed -i '/<h1>NP-SOLUTIONS<\/h1>/d' "$file"
done

echo "✅ Titre supprimé. Étapes Git en cours..."

git add test/*.html
git commit -m "Suppression du titre h1 NP-SOLUTIONS dans le header"
git push origin main

echo "🚀 Modifications poussées sur GitHub."
