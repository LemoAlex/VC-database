#!/bin/sh
eval "$(conda shell.bash hook)"
while read p; do  
conda activate  unicycler-env

#This time, we're using unicycler for long reads sequences. Here, nanopore.
cd $p 
unicycler -l $p.fastq -o output_unicycler
cd .. ;

done < longreads_strains
