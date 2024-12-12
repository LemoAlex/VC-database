#!/bin/sh

eval "$(conda shell.bash hook)"  #This line is to activate conda environment in a bash setting


#for each line, we download the assembly using the datasets command, and then keep only the assembly (.fna) before deleting the folder to save some space
while read p; do  
conda activate ncbi-datasets-cli-env

datasets download genome accession $p
unzip ncbi_dataset.zip


cp ncbi_dataset/data/$p/*.fna GCF_genomes/
rm -r ncbi_dataset
rm README.md
conda deactivate

 done < strains_GCF

