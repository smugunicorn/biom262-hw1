#!/bin/bash
#PBS -q hotel
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

#Exercise 3
#Use bedtools to find promoters (2000 bases upstream of gene)
bedtools flank -i gencode.v19.annotation.chr22.transcript.gtf -g hg19.genome -l 2000 -r 0 -s > gencode.v19.annotation.chr22.transcript.promoter.gtf





