#!/bin/csh
#PBS -q hotel
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

Exercise 1 
grep "NFKB" tf.bed > tf.nfkb.bed

Exercise 2
awk '{if ($3 == "transcript")print}' gencode.v19.annotation.chr22.gtf > gencode.v19.annotation.chr22.transcript.gtf

Exercise 3
module load biotools
bedtools flank -i gencode.v19.annotation.chr22.transcript.gtf -g hg19.genome -l 2000 -r 0 -s > gencode.v19.annotation.chr22.transcript.promoter.gtf








echo "Hello I am a message in standard out (stdout)"

