mkdir -p scaffold_tables

for f in indexed/*.bgz
do
    base=$(basename "$f" .bgz)

    cut -f1,2 ${f}.fai \
        > scaffold_tables/${base}_scaffolds.tsv

    zgrep '^>' "$f" | \
    sed 's/^>//' | \
    awk 'BEGIN{OFS="\t"}
         {
             id=$1
             desc=$0
             sub("^[^ \t]+[ \t]*", "", desc)
             print id, desc
         }' \
    > scaffold_tables/${base}_descriptions.tsv

    awk 'BEGIN{OFS="\t"} {print $1,$2}' "${f}.fai" \
    > scaffold_tables/${base}_lengths.tsv

    awk 'BEGIN{OFS="\t"}
         NR==FNR {
             len[$1]=$2
             next
         }
         {
             old=$1
             desc=$0
             sub("^[^\t]+\t", "", desc)
             print old, len[old], desc, "", "", ""
         }' \
         scaffold_tables/${base}_lengths.tsv \
         scaffold_tables/${base}_descriptions.tsv \
    > scaffold_tables/${base}_rename_template.tmp

    {
        echo -e "old_name\tlength\tdescription\tnew_name\tchromosome_type\tnotes"
        cat scaffold_tables/${base}_rename_template.tmp
    } > scaffold_tables/${base}_rename_tab.txt

    rm scaffold_tables/${base}_rename_template.tmp
done

