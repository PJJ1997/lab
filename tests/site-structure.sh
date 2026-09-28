#!/bin/sh
set -eu

topics="adjustable-bases upholstery-products mechanisms-components foam-cushioning materials product-design"

for topic in $topics; do
  grep -q "href=\"#$topic\"" index.html
  grep -q "class=\"topic-detail\" id=\"$topic\"" index.html
done

test "$(grep -c 'class=\"topic-detail\"' index.html)" -eq 6
grep -q 'body:has(.topic-detail:target) .documents-panel' styles.css
grep -q '.topic-detail:target' styles.css
grep -q '.document-table-scroll' index.html
grep -q '@media (max-width:650px)' styles.css
grep -q '.topic-detail { height:auto;' styles.css

echo "Topic page structure checks passed."
