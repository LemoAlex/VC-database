#!/bin/sh
eval "$(conda shell.bash hook)"


while read p; do  
conda activate sratools-env


prefetch $p 

fasterq-dump $p --outdir $p/ ; 

conda deactivate 

conda activate spades-env

cd $p 
spades.py -1 ${p}_1.fastq -2 ${p}_2.fastq  -t 64 -o spades_output
rm *_1.fastq
rm *_2.fastq
mv spades_output/scaffolds.fasta .
mv scaffolds.fasta genome_$p.fasta
conda deactivate spades-env 
cd .. ;

done < strains_GCA

