module load samtools

for f in raw_downloads/*.fna.gz
do
    base=$(basename $f .fna.gz)

    gunzip -c $f | bgzip > indexed/${base}.bgz

    samtools faidx indexed/${base}.bgz
done
