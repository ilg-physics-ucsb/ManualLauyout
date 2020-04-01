#!/bin/bash
pandoc -s -f markdown+smart -t html5 -c ./ManualLayout/css/pandoc.css --mathjax --metadata-file=./ManualLayout/meta.yml --filter panflute  --resource-path=./ManualLayout/imgs $1 > $2
echo "..."
echo "Done"