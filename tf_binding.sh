#!/bin/csh
#PBS -q <hotel>
#PBS -N <Biom262-hw1>
#PBS -l nodes=10:ppn=2
#PBS -l walltime=0:50:00
#PBS -o <tf_binding.sh.o######>
#PBS -e <tf_binding.sh.e######>
#PBS -V
#PBS -M <email address list>
#PBS -m abe
#PBS -A <account>
cd /oasis/tscc/scratch/<user name>
mpirun -v -machinefile $PBS_NODEFILE -np 20 <./mpi.out>

Exercise 1 
grep "NFKB" tf.bed > tf.nfkb.bed

Exercise 2
awk '{if ($3 == "transcript")print}' gencode.v19.annotation.chr22.gtf > gencode.v19.annotation.chr22.transcript.gtf

Exercise 3
module load biotools
bedtools flank -i gencode.v19.annotation.chr22.transcript.gtf -g hg19.genome -l 2000 -r 0 -s > gencode.v19.annotation.chr22.transcript.promoter.gtf


