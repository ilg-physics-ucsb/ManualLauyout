#!/bin/bash
pandoc -s -f markdown+smart -t html5 -c ./css/pandoc.css --mathjax --metadata-file=meta.yml --filter panflute  --resource-path=./imgs $1 > $2
echo "..."
echo "Done"