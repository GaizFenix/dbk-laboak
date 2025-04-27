#!/bin/bash

# SPARQL endpointaren URLa
ENDPOINT_URL="http://34.34.143.215:7200/repositories/dbk"

# SPARQL kontsulta
QUERY=$(cat <<EOF
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>

SELECT ?location WHERE {
    ?person foaf:name "Aitor Labajo" .
    ?person <http://vocab.data.gov/def/drm#worksFor> ?museo .
    ?museo rdfs:label ?location .
}
EOF
)

# cURL erabiliz SPARQL POST eskaera egitea
curl -X POST "$ENDPOINT_URL" \
    -H "Content-Type: application/sparql-query" \
    --data "$QUERY"
