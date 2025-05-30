#!/bin/bash

echo "🔧 Remplacement du formulaire par la version fonctionnelle dans contact.html et index.html..."

# Utilisation d'un fichier temporaire pour injecter le nouveau formulaire
FORM_FILE="formulaire_temp.html"

cat <<EOF > "$FORM_FILE"
<form action="https://formspree.io/f/mqkrnpay" method="POST">
  <label for="nom">Nom :</label><br />
  <input type="text" id="nom" name="nom" required /><br /><br />

  <label for="email">Email :</label><br />
  <input type="email" id="email" name="email" required /><br /><br />

  <label for="message">Message :</label><br />
  <textarea id="message" name="message" rows="5" required></textarea><br /><br />

  <button type="submit">Envoyer</button>
</form>
EOF

for file in test/contact.html test/index.html; do
  if [ -f "$file" ]; then
    # Supprimer tout ancien formulaire et insérer le nouveau
    sed -i.bak -e "/<form/,/<\/form>/d" "$file"
    sed -i.bak "/<\/main>/e cat $FORM_FILE" "$file"
    echo "✅ Formulaire mis à jour dans $file"
  else
    echo "❌ Fichier $file introuvable"
  fi
done

rm "$FORM_FILE"

echo "📦 Étapes Git en cours..."
git add test/contact.html test/index.html
git commit -m "✅ Formulaire remplacé par la version fonctionnelle Formspree"
git push origin main

echo "🚀 Mise à jour terminée avec succès !"

