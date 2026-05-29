# Bombyx_W_analyses
Data, code, and results relating to the analysis of the Bombyx W chromosome

## Script Order
### Working in `data_downloads`
1. `download_assemblies.sh` retrieves assemblies from databases into `raw_downloads`
2. `index_assemblies.sh` recompresses with bgzip and indexes them with samtools in `renamed_fasta`
3. `tabulate_scaffolds.sh` reads fasta indexes and tabulates in tsv files in `rename_maps`
4. `rename_fastas.R` consistently renames chromosomal scaffolds and excludes all other scaffolds, placing the resulting fastas in `rename_fasta`
5. `index_assemblies_renamed` recompresses with bgzip and indexes them with samtools. I manually deleted the output from `rename_fastas.R` since they were no longer needed.
6. `subset_scaffolds.sh` partitions renamed assemblies into W or ZA subsets.

