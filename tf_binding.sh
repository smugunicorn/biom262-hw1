#!/bin/bash
#PBS -q hotel
#PBS -N YHuang_MHunt_biom262_HW1
#PBS -l nodes=10:ppn=2
#PBS -l walltime=0:10:00

cd ~/code/biom262-2016/weeks/week01/data

#Exercise 1 
grep "NFKB" tf.bed > tf.nfkb.bed

#Exercise 2
awk '{if ($3 == "transcript")print}' gencode.v19.annotation.chr22.gtf > gencode.v19.annotation.chr22.transcript.gtf

#Exercise 3
module load biotools
bedtools flank -i gencode.v19.annotation.chr22.transcript.gtf -g hg19.genome -l 2000 -r 0 -s > gencode.v19.annotation.chr22.transcript.promoter.gtf

#Exercise 4 
bedtools intersect -a gencode.v19.annotation.chr22.transcript.promoter.gtf -b tf.nfkb.bed > gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf

#Exercise 5
bedtools getfasta -fi GRCh37.p13.chr22.fa -bed gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf -s -fo gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta

#Exercise 6
### we used grep -F -f nfkb.paper.fasta gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta > ex6.out.fasta. Overall in looking at the data that Wong et al. generated looks pretty similar to ours. 462 of the 11mer's from their "cannonical" NFKB binding results overlay with our outputs (2442). However I could find none of the "non-cannonical" motifs they showed overlapping with our dataset. This shows why sometimes wetlab work must be done to verify bioinformatically obtained inferences.



echo "Hello I am a message in standard error (stderr) >&2"
