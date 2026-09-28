#!/bin/sh
set -eu

topics="adjustable-bases upholstery-products mechanisms-components foam-cushioning materials product-design"

for topic in $topics; do
  grep -q "href=\"#$topic\"" index.html
  grep -q "class=\"topic-detail\" id=\"$topic\"" index.html
done

test "$(grep -c 'class=\"topic-detail\"' index.html)" -eq 6
grep -q 'body:has(.topic-detail:not(.process-topic-detail):not(.technology-topic-detail):not(.factory-detail):not(.resource-topic-detail):target) .materials-documents' styles.css
grep -q '.topic-detail:target' styles.css
grep -q '.document-table-scroll' index.html
grep -q '@media (max-width:650px)' styles.css
grep -q '.topic-detail { height:auto;' styles.css

echo "Topic page structure checks passed."

process_topics="manufacturing-processes production-operations industrial-robotics control-automation quality-testing process-improvement"
grep -q 'id="manufacturing-automation"' index.html
grep -q 'href="#manufacturing-automation"' index.html
grep -q '>Manufacturing &amp; Automation<' index.html
for topic in $process_topics; do
  grep -q "href=\"#$topic\"" index.html
  grep -q "class=\"topic-detail process-topic-detail\" id=\"$topic\"" index.html
done
test "$(grep -c 'class=\"process-topic-card\"' index.html)" -eq 6
test "$(grep -c 'class=\"topic-detail process-topic-detail\"' index.html)" -eq 6
grep -q '.process-hero' styles.css
grep -q 'class="process-topic-icon' index.html
test "$(grep -c '<strong>Automation &amp; Robotics</strong>' index.html || true)" -eq 0
grep -q '.knowledge-grid { display:grid; grid-template-columns:repeat(3,1fr);' styles.css
grep -q 'body:has(.process-topic-detail:target) .process-documents' styles.css
grep -q 'class="documents-panel process-documents"' index.html

echo "Manufacturing and Automation page checks passed."

technology_topics="ai-intelligent-systems digital-twin-simulation iot-connected-systems additive-manufacturing emerging-technologies research-innovation-projects"
grep -q 'id="technology-innovation"' index.html
grep -q 'href="#technology-innovation"' index.html
for topic in $technology_topics; do
  grep -q "href=\"#$topic\"" index.html
  grep -q "class=\"topic-detail technology-topic-detail\" id=\"$topic\"" index.html
done
test "$(grep -c 'class=\"technology-topic-card\"' index.html)" -eq 6
test "$(grep -c 'class=\"topic-detail technology-topic-detail\"' index.html)" -eq 6
grep -q 'class="documents-panel technology-documents"' index.html
grep -q 'body:has(.technology-topic-detail:target) .technology-documents' styles.css

echo "Technology and Innovation page checks passed."

factories="arcadia advance chippewa-falls ecru leesport mesquite ripley saltillo verona vietnam"
grep -q '<a class="top-nav-link" href="#factories">Factories</a>' index.html
grep -q 'id="factories"' index.html
for factory in $factories; do
  grep -q "id=\"factory-$factory\"" index.html
  grep -q "href=\"#factory-$factory\"" index.html
  grep -q "class=\"topic-detail factory-detail\" id=\"factory-$factory\"" index.html
done
test "$(grep -c 'class=\"factory-card\"' index.html)" -eq 10
test "$(grep -c 'class=\"topic-detail factory-detail\"' index.html)" -eq 10
grep -q '.factories-grid { display:grid; grid-template-columns:repeat(3,1fr);' styles.css
test "$(grep -c 'Search factories' index.html || true)" -eq 0
grep -q 'class="documents-panel factory-documents"' index.html
grep -q 'body:has(.factory-detail:target) .factory-documents' styles.css

echo "Factories page checks passed."

grep -q '<a class="top-nav-link" href="#vendors">Vendors</a>' index.html
test "$(grep -c '<button class="top-nav-link">Vendors' index.html || true)" -eq 0
grep -q 'class="vendors-page" id="vendors"' index.html
grep -q '<h2>Vendors</h2>' index.html
test "$(grep -c 'class="vendor-stat-card"' index.html)" -eq 6
grep -q '<strong>128</strong>' index.html
grep -q '<strong>24</strong>' index.html
grep -q '<strong>36</strong>' index.html
grep -q 'class="vendor-resources"' index.html
test "$(grep -c 'class="vendor-filter"' index.html)" -eq 5
test "$(grep -c 'class="vendor-document-row"' index.html)" -eq 7
test "$(grep -c 'class="vendor-help-card"' index.html)" -eq 4
grep -q '.vendors-page:target' styles.css
grep -q '.vendor-stats-grid' styles.css
grep -q '.vendor-document-row' styles.css
grep -q '.vendor-help-grid' styles.css

echo "Vendors page checks passed."

grep -q '<a class="top-nav-link" href="#resources">Resources</a>' index.html
test "$(grep -c '<button class="top-nav-link">Resources' index.html || true)" -eq 0
grep -q 'class="resources-page" id="resources"' index.html
grep -q '<h2>Resources</h2>' index.html
test "$(grep -c 'class="resource-topic-card"' index.html)" -eq 4
test "$(grep -c 'class="featured-resource-card"' index.html)" -eq 4
test "$(grep -c 'class="resource-quick-card"' index.html)" -eq 4
resource_topics="resource-templates resource-standards resource-training resource-tools"
for topic in $resource_topics; do
  grep -q "href=\"#$topic\"" index.html
  grep -q "class=\"topic-detail resource-topic-detail\" id=\"$topic\"" index.html
done
test "$(grep -c 'class="topic-detail resource-topic-detail"' index.html)" -eq 4
grep -q 'class="documents-panel resource-documents"' index.html
grep -q 'body:has(.resource-topic-detail:target) .resource-documents' styles.css
grep -q '.resources-page:target' styles.css
grep -q '.resource-topics-grid' styles.css
grep -q '.featured-resources-grid' styles.css
grep -q '.resource-quick-grid' styles.css

echo "Resources page checks passed."
