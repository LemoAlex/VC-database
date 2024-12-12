# VC-database
Vibrio cholerae custom database creation.

Aim : 

Create a local database containing Vibrio cholerae genomes. These will be collected from both already assembled Genomes ( Refseq / Genbank), and also newly assembled genomes coming from SRA reads (ncbi).


Methods : 


Mamba: https://github.com/mamba-org/mamba (or Conda, in order to create a virtual environment for each software) 

SRAtools : https://github.com/ncbi/sra-tools 

Spades: https://github.com/ablab/spades

Unicycler: https://github.com/rrwick/Unicycler

The database creation will be in 4 parts:
1. Genome assembled using Spades from SRA reads. --> We need a strain list with the SRA accession numbers. We did a litterature search for this, but a "general one" can be found for VC in Legault et al. 2021 ( DOI: 10.1126/science.abg2166 )
2. Genomes from Refseq database (simple download)
3. Genomes from Genbank
4. Genome assembled using Unicycler from long reads
