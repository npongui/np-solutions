#!/bin/bash
echo "🔁 Renommage forcé des fichiers HTML avec la bonne casse..."

# Étape 1 : renommage temporaire
mv test/Apropos.html test/_apropos_temp.html
mv test/Contact.html test/_contact_temp.html
mv test/References.html test/_references_temp.html

git add test/_apropos_temp.html test/_contact_temp.html test/_references_temp.html
git commit -m "Renommage temporaire des fichiers pour forcer Git à détecter le changement de casse"

# Étape 2 : renommage final
mv test/_apropos_temp.html test/apropos.html
mv test/_contact_temp.html test/contact.html
mv test/_references_temp.html test/references.html

git add test/apropos.html test/contact.html test/references.html
git rm test/_apropos_temp.html test/_contact_temp.html test/_references_temp.html

git commit -m "Renommage final des fichiers avec la bonne casse"
git push origin main

echo "✅ Renommage terminé et poussé sur GitHub."
