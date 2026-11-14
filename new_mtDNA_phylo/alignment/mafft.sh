#!/bin/bash
#SBATCH -t 72:00:00
#SBATCH -c 10
#SBATCH --mem=128G
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -J mafft

module load mafft/7.525

DIR="/scratch/m850d048/Bmori/mitochondia/new_mtDNA_phylo"


#aligment
mafft --maxiterate 6  --thread 10 ${DIR}/preprocessing/Bombyx_mtDNA_new_trimmed_outgroup.fasta \
	> ${DIR}/alignment//Bombyx_mtDNA_new_trimmed_outgroup_align.fasta
