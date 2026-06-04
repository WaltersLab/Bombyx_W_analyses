#!/bin/bash
#SBATCH --job-name=mm2_Wasm5
#SBATCH --cpus-per-task=16
#SBATCH --mem=16G
#SBATCH --time=12:00:00
#SBATCH --output=logs/mm2_W_%A_%a_asm5.out
#SBATCH --error=logs/mm2_W_%A_%a_asm5.err

set -euo pipefail

# If needed on your cluster:
module load minimap2

REF_ID="p50T_ASM2736675v1"
QUERY_LIST="config/query_assemblies.txt"
FASTA_DIR="data_downloads/renamed_fasta/subsets"
OUT_DIR="alignments/W"

query=$(sed -n "${SLURM_ARRAY_TASK_ID}p" "$QUERY_LIST")

ref="${FASTA_DIR}/${REF_ID}_W.fas.gz"
qry="${FASTA_DIR}/${query}_W.fas.gz"
out="${OUT_DIR}/${query}_vs_${REF_ID}_W.asm5.paf"

echo "Reference: $ref"
echo "Query:     $qry"
echo "Output:    $out"

minimap2 -t "${SLURM_CPUS_PER_TASK}" "$ref" "$qry" > "$out"
