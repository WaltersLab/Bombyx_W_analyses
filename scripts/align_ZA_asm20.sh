#!/bin/bash
#SBATCH --job-name=mm2_ZAasm20
#SBATCH --cpus-per-task=16
#SBATCH --mem=32G
#SBATCH --time=12:00:00
#SBATCH --output=logs/mm2_ZA_%A_%a_asm20.out
#SBATCH --error=logs/mm2_ZA_%A_%a_asm20.err

set -euo pipefail

# If needed on your cluster:
module load minimap2

REF_ID="p50T_ASM2736675v1"
QUERY_LIST="config/query_assemblies.txt"
FASTA_DIR="data_downloads/renamed_fasta/subsets"
OUT_DIR="alignments/ZA"

query=$(sed -n "${SLURM_ARRAY_TASK_ID}p" "$QUERY_LIST")

ref="${FASTA_DIR}/${REF_ID}_ZA.fas.gz"
qry="${FASTA_DIR}/${query}_ZA.fas.gz"
out="${OUT_DIR}/${query}_vs_${REF_ID}_ZA.asm20.paf"

echo "Reference: $ref"
echo "Query:     $qry"
echo "Output:    $out"

minimap2 -x asm20 -t "${SLURM_CPUS_PER_TASK}" "$ref" "$qry" > "$out"
