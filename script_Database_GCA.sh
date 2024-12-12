#!/bin/sh

eval "$(conda shell.bash hook)"


while read p; do  
conda activate macsyfinder-env

datasets download genome accession $p
unzip ncbi_dataset.zip


cp ncbi_dataset/data/$p/*.fna GCF_genomes/
rm -r ncbi_dataset
rm README.md
conda deactivate

 done < strains_GCF

