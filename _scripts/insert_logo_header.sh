#!/bin/bash

# Chemin du logo à insérer
logo='<img src="images/logo-nps.png" alt="Logo NP-SOLUTIONS" style="width:120px; margin-right:20px;" />'

# Itérer sur tous les fichiers HTML dans test/
for file in test/*.html; do
  # Ajouter le logo avant la balise <h1> dans le <header>
  awk -v logo="$logo" '
    /<header>/ { print; next }
    /<h1>/ && !done { print logo; done=1 }
    { print }
  ' "$file" > tmp && mv tmp "$file"
done

# Ajouter et commit dans git
git add test/*.html
git commit -m "Ajout automatique du logo NP-SOLUTIONS dans le header"
