# VC-database
Vibrio cholerae custom database creation.

Aim : 

Create a local database containing Vibrio cholerae genomes. These will be collected from both already assembled Genomes ( Refseq / Genbank), and also newly assembled genomes coming from SRA reads (ncbi).


Methods : 


Mamba: https://github.com/mamba-org/mamba (or Conda, in order to create a virtual environment for each software) 

SRAtools : https://github.com/ncbi/sra-tools 

ncbi-datasets: https://github.com/ncbi/datasets

Spades: https://github.com/ablab/spades

Unicycler: https://github.com/rrwick/Unicycler

The database creation will be in 4 parts:
1. Genome assembled using Spades from SRA reads.
2. Genomes from Refseq database (simple download)
3. Genomes from Genbank
4. Genome assembled using Unicycler from long reads


For each step, we need a strain list with the accession numbers (SRA, Refseq,Genbank...). It can be through litterature search, through the NCBI website, or through some previous databases (e.g.Legault et al. 2021 ( DOI: 10.1126/science.abg2166 ))


Usage for each script is : sh script_*.sh
