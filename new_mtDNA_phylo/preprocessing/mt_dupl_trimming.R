library(Biostrings)
library(tidyverse)

setwd("D:/work/Bmori/mitochondria/")


mt <- readDNAStringSet("./input_data/Bombyx_mtDNA_new.fasta")


#duplicate sequence and restore sequence names
mt_dupl <- xscat(mt, mt)
names(mt_dupl) <- names(mt)


#paterns to cut the sequence
pattern <- "ATGAAATAGGTAAATATCTTTTTCAAGCTAAATA"
huttoni_pattern <- "aagaaataggtaaatatctttttcaagataaata"

mt_dupl_rc <- reverseComplement(mt_dupl)


trim_by_pattern <- function(seqs, pattern, max.mismatch = 1, max_len = 20000) {
  hits <- vmatchPattern(pattern = pattern, subject = seqs, max.mismatch = max.mismatch)
  
  start <- map(endIndex(hits), 1)
  start[sapply(start, is.null)] <- NA
  start <- unlist(start)
  
  end <- map(endIndex(hits), 2)
  end[sapply(end, is.null)] <- NA
  end <- unlist(end)
  
  out <- subseq(seqs, start = start, end = end)
  out[nchar(out) < max_len] 
}

trimmed <- c(
  trim_by_pattern(mt_dupl,    pattern),
  trim_by_pattern(mt_dupl_rc, pattern)
)

writeXStringSet(trimmed, filepath = "./Bombyx_mtDNA_new_trimmed.fasta", format = "fasta")



