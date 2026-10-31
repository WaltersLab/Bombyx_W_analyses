echo  "Repeat	Type	Class" > repeat_classes.tsv
grep '>'  ../../../Bombyx_repeat_library_v1.fasta  | awk 'BEGIN{OFS="\t"} /^>/{sub(/^>/,""); n=split($0,a,/[#\/]/); print a[1],a[2],(n>=3 ? a[3] : "NA")}'  >> repeat_classes.tsv
