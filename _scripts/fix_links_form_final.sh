#!/bin/bash

echo "🔧 Correction des liens internes et du formulaire dans /test..."

# Corriger le lien erroné "a-propos.html" → "apropos.html"
FILES=test/*.html
for file in $FILES; do
  sed -i 's/a-propos\.html/apropos.html/g' "$file"
done

# Corriger l'action du formulaire dans contact.html
FORM_FILE="test/contact.html"
if [ -f "$FORM_FILE" ]; then
  sed -i 's|<form action="[^"]*" method="POST">|<form action="https://formspree.io/f/YOUR_FORM_ID" method="POST">|' "$FORM_FILE"
  echo "✅ Formulaire corrigé dans $FORM_FILE"
else
  echo "❌ Formulaire non trouvé dans $FORM_FILE"
fi

echo "✅ Liens internes mis à jour."
