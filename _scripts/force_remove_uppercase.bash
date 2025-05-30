#!/bin/bash
echo "🔧 Suppression explicite des fichiers en majuscules dans Git..."

# Suppression ciblée dans Git (mais pas localement)
git rm --cached test/Apropos.html test/Contact.html test/References.html

# Commit de la suppression
git commit -m "Suppression des fichiers en majuscules dans /test (Apropos, Contact, References)"

# Push vers GitHub
git push origin main

echo "✅ Fichiers en majuscules supprimés du dépôt GitHub."
