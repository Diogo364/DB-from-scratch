# !/bin/bash

echo "SPLIT DATABASE $1"

iconv -f utf-16le -t utf-8 $1 > /tmp/coded.csv

echo "GENERATING REVENDA.CSV"
cat /tmp/coded.csv | cut -f1-5,11 > /tmp/raw_revenda.csv
awk -F '\t' ' {key =$5} !seen[key]++' /tmp/raw_revenda.csv > /tmp/revenda.csv


echo "GENERATING PRODUTO.CSV"
cat /tmp/coded.csv | cut -f5-10 > /tmp/produto.csv