# Bombyx_W_analyses
Data, code, and results relating to the analysis of the Bombyx W chromosome

# W dot plots
## Script Order
### Working in `data_downloads`
1. `download_assemblies.sh` retrieves assemblies from databases into `raw_downloads`
2. `index_assemblies.sh` recompresses with bgzip and indexes them with samtools in `renamed_fasta`
3. `tabulate_scaffolds.sh` reads fasta indexes and tabulates in tsv files in `rename_maps`
4. `rename_fastas.R` consistently renames chromosomal scaffolds and excludes all other scaffolds, placing the resulting fastas in `rename_fasta`
5. `index_assemblies_renamed` recompresses with bgzip and indexes them with samtools. I manually deleted the output from `rename_fastas.R` since they were no longer needed.
6. `subset_scaffolds.sh` partitions renamed assemblies into W or ZA subsets.

### Doing alignments
7. `align_W.sh` & `align_ZA.sh` in `scripts` are sbatch scripts configured for using SLURM task arrays to perform all of the alignments. Paths in these scripts are configured assuming they are invoked from the project root dir.
8. `runZAaligns.sh`& `runWaligns.sh` are simple wrappers to record the execution of the sbatch array command on the alignment scripts, placed in project root so that they execute with the correct relative filepaths needed for the alignments scripts.

# Other figures
The folder `figure_data_code` includes R markdown scripts for generating figure 2-7 in the manuscript, along with required data in `input_files`.
