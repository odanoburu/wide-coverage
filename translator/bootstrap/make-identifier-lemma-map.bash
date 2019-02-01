#!bin/bash

set -e
errcho(){ >&2 echo "$@"; }

mkdir tmp || errcho "rm tmp directory" # will throw error if existant, just remove it
errcho 'get only "good" predictions and lowercase second field'
grep 'True$' predictions.tsv | awk -F $'\t' 'BEGIN {OFS = FS} $2 = tolower($2)' | LC_ALL=C sort -u -t $'\t' -k 1 > tmp/sorted-predictions.tsv
errcho 'get only synset and word lemma'
sed -nEe $'s/^([0-9]+)-[nrvas]\t([^\t]+)\t([^\t]+).*/\\2-\\1\t\\3/p' tmp/sorted-predictions.tsv | LC_ALL=C sort -t $'\t' -k 1 > tmp/synset-lemma.tsv
errcho 'extract fun names and their synsets, then sort by synset.'
sed -nEe $'s/^fun +([^A-Z]+)([A-Z]?[^_]*)_([^ ])[^-]+--[^0-9]+([0-9]+).*/\\1-\\4\t\\1\\2_\\3/p' ../Dictionary.gf | LC_ALL=C sort -t $'\t' -k 1 > tmp/synset-fun.tsv
errcho 'join by synset'
# maybe using -e switch here would save a lot of commands
LC_ALL=C join -t $'\t' -j 1 tmp/synset-fun.tsv tmp/synset-lemma.tsv > tmp/fun-lang.tsv
errcho 'cut to what we want (GF fun name and lemma in target language) and merge lines with the same fun name'
cut -d $'\t' -f 2,3 tmp/fun-lang.tsv | LC_ALL=C sort -u -t $'\t' -k 1 | awk -F '\t' 'NF>1{a[$1] = a[$1]"\t"$2};END{for(i in a)print i""a[i]}' | sort -t $'\t' -k 1 > fun-lemmas.tsv
errcho 'get missing gf funs and add missing lin'
sed -nEe 's/^fun +([^ ]+).*/\1/p' ../Dictionary.gf > tmp/all-funs.txt
LC_ALL=C join -t $'\t' -v 1 -j 1 <(LC_ALL=C sort -t $'\t' -k 1 tmp/all-funs.txt) <(LC_ALL=C sort -t $'\t' -k 1 fun-lemmas.tsv) >> fun-lemmas.tsv
rm -r tmp
