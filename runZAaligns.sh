#sbatch --array=1-6 scripts/align_ZA_asm5.sh
#sbatch --array=1-6 scripts/align_ZA_asm20.sh
sbatch --array=1-6 scripts/align_ZA_default.sh
