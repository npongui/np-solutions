#!/bin/bash

echo "🔧 Correction des liens de navigation dans les fichiers HTML du dossier /test..."

TARGET_DIR="test"

for file in $TARGET_DIR/*.html; do
  echo "🔍 Traitement de $file..."

  # Liens de navigation
  sed -i 's|<a href="#">Accueil</a>|<a href="index.html">Accueil</a>|g' "$file"
  sed -i 's|<a href="#">À propos</a>|<a href="Apropos.html">À propos</a>|g' "$file"
  sed -i 's|<a href="#">Expertises</a>|<a href="expertises.html">Expertises</a>|g' "$file"
  sed -i 's|<a href="#">Références</a>|<a href="References.html">Références</a>|g' "$file"
  sed -i 's|<a href="#">Blog</a>|<a href="blog.html">Blog</a>|g' "$file"
  sed -i 's|<a href="#">Contact</a>|<a href="Contact.html">Contact</a>|g' "$file"

  # Bouton "Nous contacter"
  sed -i 's|<button>Nous contacter</button>|<a href="Contact.html"><button>Nous contacter</button></a>|g' "$file"

  # Lien LinkedIn dans le footer
  sed -i 's|LinkedIn|<a href="https://www.linkedin.com/company/np-solutions-digital" target="_blank">LinkedIn</a>|g' "$file"
done

echo "✅ Liens corrigés dans les fichiers HTML du dossier /test."
