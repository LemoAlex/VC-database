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



conda activate ncbi_datasets-env
datasets download genome taxon 666 --assembly-source 'Refseq' --dehydrated --include genome --exclude-multi-isolate

mv ncbi_dataset.zip vibrio_refseq_1965.zip
unzip -d vibrio_refseq_1965 vibrio_refseq_1965.zip
datasets rehydrate --directory vibrio_refseq_1965


datasets download genome taxon 666 --assembly-source 'Genbank' --dehydrated --include genome --exclude-multi-isolate --mag exclude --filename genbank.zip

mv ncbi_dataset.zip vibrio_Genbank_2209.zip
unzip -d vibrio_Genbank_2209 vibrio_Genbank_2209.zip
datasets rehydrate --directory vibrio_Genbank_2209



datasets summary genome taxon "666" --exclude-multi-isolate --mag exclude --as-json-lines  > update_datasets_200225
 dataformat tsv genome --inputfile update_datasets_200225 > metadata_date.tsv
 cut -f 1,44,49,60,76,109,152,165,169 metadata_date.tsv | uniq > final_metadata.tsv ## MANUALLY CHECK FOR MISSING SOURCE_DATABASE AND REPLACE WITH REFSEQ//GENBANK

 
grep 'REFSEQ' final_metadata.tsv | cut -f 3 > BIOSAMPLE_refseq
grep 'GENBANK' final_metadata.tsv > GENBANK.tsv
grep -f BIOSAMPLE_refseq -v GENBANK.tsv


#ALL

datasets download genome taxon 666 --dehydrated --include genome --exclude-multi-isolate --mag exclude --filename vc_240225.zip
unzip -d vc_240225.zip
mkdir vc_240225
cp -r ncbi_dataset vc_240225
rm -r ncbi_dataset
datasets rehydrate --directory vc_240225
datasets summary genome taxon "666" --exclude-multi-isolate --mag exclude --as-json-lines  > update_datasets_240225
 dataformat tsv genome --inputfile update_datasets_240225 > metadata_date.tsv
