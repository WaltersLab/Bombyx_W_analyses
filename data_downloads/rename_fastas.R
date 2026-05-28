library(Biostrings)

fastas <- dir("raw_downloads")
basenames <- gsub(x = fastas,
                  pattern = ".fna.gz", 
                  replacement = "")

getChroms <- function(asm) {
  # read in table of current scaffold names 
  # and corresponding chromosomes
  chromNames <- read.delim(paste0("rename_maps/", asm, 
                           "_rename_tab.txt")
                           )
  # read in FASTA files
  dna <- readDNAStringSet(paste0("raw_downloads/", asm,
                                 ".fna.gz" )
                          )
  # pare down names to only the accession ID
  names(dna) <- sub("\\s.*", "", x = names(dna) )
  
  # match accession ID with chromosome ID, and rename
  match_idx <- match(names(dna), chromNames$old_name)
  names(dna) <- chromNames$new_name[match_idx]
  
  # extract only chromosomal scaffolds
  chromScaffs <- grep(x = names(dna), pattern = "Chr")
  
  writeXStringSet(dna[chromScaffs], 
                  paste0("renamed_fasta/",
                         asm,"_chr.fas.gz"),
                  compress = "gzip")
}

# getChroms(asm = basenames[1])

for (i in basenames) {
  getChroms(asm = i)
}
