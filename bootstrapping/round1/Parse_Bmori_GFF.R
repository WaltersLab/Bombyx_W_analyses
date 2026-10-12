library("BootstrapBombyxRepeats")
library("GenomicRanges")

ingff <- "/nfs/work/jwalters/mdalikova/Bombyx/p50T_RepeatMasker.out.gff"
inChr <- "Bmori_ChrAccLen.tsv"


bmRepeats <- read_repeatmasker_gff(gff_file = ingff)

bmChroms <- read.delim(file = inChr)


# create a look-up vector with `Chr` values and Accession names
lookupVec <- setNames(nm = bmChroms$contig ,
                      object = paste0("Chr",bmChroms$chromosome) )

# now rename the sequences with appropriate BioC command, 
# which updates seqlevels metadata in GRanges object
bmRepeats <- GenomeInfoDb::renameSeqlevels(bmRepeats, lookupVec)

# Also create a chrom-lengths vector for use with functions
bmChrLengths <- setNames(object = bmChroms$length ,
                         nm = paste0("Chr",bmChroms$chromosome) )


# Resolve Repeats
bmSysTime <- system.time(
  bmResolved <- resolve_repeat_overlaps(
    repeats = bmRepeats,
    score_col = "score",
    family_col = "repeat_family",
    mc.cores = 30,
    verbose = TRUE
  )
)

print(bmSysTime)

save(bmResolved, file = "Bmori_Repeats_Resolved.Rda")


