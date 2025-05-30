#!/bin/bash

echo "🔧 Mise à jour des liens de navigation et du footer sans toucher au header..."

FILES=test/*.html

for file in $FILES; do
  echo "🔍 Traitement de $file..."

  # Corriger les liens de menu de navigation
  sed -i 's|<a href="#">Accueil</a>|<a href="index.html">Accueil</a>|g' "$file"
  sed -i 's|<a href="#">À propos</a>|<a href="Apropos.html">À propos</a>|g' "$file"
  sed -i 's|<a href="#">Expertises</a>|<a href="expertises.html">Expertises</a>|g' "$file"
  sed -i 's|<a href="#">Références</a>|<a href="References.html">Références</a>|g' "$file"
  sed -i 's|<a href="#">Blog</a>|<a href="blog.html">Blog</a>|g' "$file"
  sed -i 's|<a href="#">Contact</a>|<a href="Contact.html">Contact</a>|g' "$file"

  # Corriger le bouton "Nous contacter"
  sed -i 's|<button>Nous contacter</button>|<a href="Contact.html"><button>Nous contacter</button></a>|g' "$file"

  # Corriger le lien LinkedIn dans le footer
  sed -i 's|LinkedIn|<a href="https://www.linkedin.com/company/np-solutions-digital" target="_blank" style="color: white;">LinkedIn</a>|g' "$file"
done

echo "✅ Liens corrigés sans suppression du header. N'oublie pas de faire un git add/commit/push."
