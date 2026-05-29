module load samtools

for f in renamed_fasta/*.bgz
do
    base=$(basename "$f" _chr.fas.bgz)

    samtools faidx "$f" $(cat ../config/autosomes_Z.txt) \
        > renamed_fasta/subsets/${base}_ZA.fas

    samtools faidx "$f" $(cat ../config/W.txt) \
        > renamed_fasta/subsets/${base}_W.fas
done

for f in renamed_fasta/subsets/*.fas
do
    bgzip -f "$f"
    samtools faidx "${f}.gz"
done
