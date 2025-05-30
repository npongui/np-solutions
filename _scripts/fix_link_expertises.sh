#!/bin/bash
echo "🔧 Correction du lien 'a-propos.html' vers 'apropos.html' dans expertises.html..."
sed -i 's/a-propos\.html/apropos.html/g' test/expertises.html
git add test/expertises.html
git commit -m "Correction du lien incorrect vers apropos.html dans expertises.html"
git push origin main
echo "✅ Lien corrigé et modification poussée sur GitHub."
