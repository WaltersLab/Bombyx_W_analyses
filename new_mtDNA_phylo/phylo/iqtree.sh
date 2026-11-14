#!/bin/bash
#SBATCH -t 48:00:00
#SBATCH -c 5
#SBATCH --mem=32G
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -J iqtree

module load conda/bioconda
module load iqtree

ALIGMENT="/scratch/m850d048/Bmori/mitochondia/new_mtDNA_phylo/alignment"
DIR="/scratch/m850d048/Bmori/mitochondia/new_mtDNA_phylo/phylo"


iqtree3 -s ${ALIGMENT}/Bombyx_mtDNA_new_trimmed_outgroup_align_gblocks.fasta \
	-o NC_026518.1 \
	--seqtype DNA -m MFP -B 1000 --alrt 1000 \
	-T AUTO -ntmax 4 --mem 30G \
	--prefix ${DIR}/Bombyx_mtDNA_new
