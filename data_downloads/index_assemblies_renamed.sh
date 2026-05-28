module load samtools

for f in renamed_fasta/*.fas.gz
do
    base=$(basename $f .gz)

    gunzip -c $f | bgzip > renamed_fasta/${base}.bgz

    samtools faidx renamed_fasta/${base}.bgz
done
