#!/bin/bash
#SBATCH --job-name=test_array
#SBATCH --output=logs/test_%A_%a.out

query=$(sed -n "${SLURM_ARRAY_TASK_ID}p" config/query_assemblies.txt)

echo "Task ID: $SLURM_ARRAY_TASK_ID"
echo "Query: $query"
