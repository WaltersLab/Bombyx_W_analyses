#!/bin/bash
#SBATCH -p intel
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 30
#SBATCH --mem=6GB
#SBATCH -t 03:00:00 
#SBATCH -J BmoriParse
#SBATCH -o BmoriParse-%j.out
#SBATCH -e BmoriParse-%j.err

module load r/4.6.1

R CMD BATCH --vanilla Parse_Bmori_GFF.R