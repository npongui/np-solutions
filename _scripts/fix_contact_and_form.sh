#!/bin/bash

echo "🔧 Correction du lien vers la page Contact et mise à jour du formulaire de contact..."

FILES=$(find test -type f -name "*.html")

# Mise à jour des liens vers Contact.html (majuscule cohérente)
for file in $FILES; do
  echo "🔍 Mise à jour du lien 'Contact' dans $file..."
  sed -i 's/href="contact.html"/href="Contact.html"/Ig' "$file"
done

# Mise à jour du formulaire dans Contact.html si présent
CONTACT_FILE="test/Contact.html"
if [ -f "$CONTACT_FILE" ]; then
  echo "📩 Mise à jour du formulaire dans $CONTACT_FILE avec Formspree..."
  sed -i '/<form/,/<\/form>/c\
  <form action="https://formspree.io/f/mnqezjlj" method="POST">\
    <label>Nom :<br><input type="text" name="name" required></label><br><br>\
    <label>Email :<br><input type="email" name="email" required></label><br><br>\
    <label>Message :<br><textarea name="message" rows="5" required></textarea></label><br><br>\
    <button type="submit">Envoyer</button>\
  </form>' "$CONTACT_FILE"
else
  echo "❌ Fichier Contact.html introuvable dans /test."
fi

# Étapes Git
echo "✅ Modifications terminées. Étapes Git en cours..."
git add test/*.html
git commit -m "Correction du lien Contact + intégration d'un formulaire fonctionnel avec Formspree"
git push origin main
echo "🚀 Modifications poussées sur GitHub."
