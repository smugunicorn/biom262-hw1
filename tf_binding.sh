#!/bin/bash
#PBS -q hotel
<<<<<<< HEAD
#PBS -N YHuang_MHunt_biom262_HW1
#PBS -l nodes=10:ppn=2
#PBS -l walltime=0:10:00
#PBS -o tf_binding.sh.o
#PBS -e tf_binding.sh.e
#PBS -V
#PBS -M yoh006@ucsd.edu 
#PBS -m abe
#PBS -A ucsd-train42
cd ~/code/biom262/weeks/week01/data2

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
### we used grep -F -f nfkb.paper.fasta gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta > ex6.out.fasta. Overall in looking at the data that Wong et al. generated looks pretty similar to ours. 462 of the 11mer's from their "cannonical" NFKB binding results overlay with our outputs (2442). However I could find none of the "non-cannonical" motifs they showed overlapping with our dataset. This shows why sometimes wetlab work must be done to verify bioinformatically ontained inferences. 
=======
#PBS -l nodes=2:ppn=2
#PBS -l walltime=:00:20:00
#PBS -N tf_binding.sh

cd ~/code/biom262-hw1/data
module load biotools

#Exercise 1
# Filter the tf.bed file for only the NFKB 
grep "NFKB" tf.bed > tf.nfkb.bed

#Exercise 2
#Filter only the rows of the gtf file that contain the fea
awk '{if ($3 == "transcript")print}' gencode.v19.annotation.chr22.gtf > gencode.v19.annotation.chr22.transcript.gtf
>>>>>>> 7e494dc1f4a69c14f87377431f74ec16593b9b29

#Exercise 3
#Use bedtools to find promoters (2000 bases upstream of gene)
bedtools flank -i gencode.v19.annotation.chr22.transcript.gtf -g hg19.genome -l 2000 -r 0 -s > gencode.v19.annotation.chr22.transcript.promoter.gtf





echo "Hello I am a message in standard error (stderr) >&2"
