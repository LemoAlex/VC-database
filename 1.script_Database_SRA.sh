#!/bin/sh
eval "$(conda shell.bash hook)"  #This line is to activate conda environment in a bash setting



# read the strain file line by line -> Accession numbers

while read p; do    
conda activate sratools-env  

#for each line, gather the sequences from SRA. resulting in a *_1.fastq *_2.fastq file

prefetch $p  

fasterq-dump $p --outdir $p/ ; 

conda deactivate 

#Activate spades to perform the denovo assembly
conda activate spades-env

cd $p 
#performing the assembly, using 64 threads.
spades.py -1 ${p}_1.fastq -2 ${p}_2.fastq  -t 64 -o spades_output
#optional, remove the raw reads to save some hardisk space
rm *_1.fastq
rm *_2.fastq

#rename the assembly based on the accession number
mv spades_output/scaffolds.fasta .
mv scaffolds.fasta genome_$p.fasta
conda deactivate spades-env 
cd .. ;

done < strains_SRA

