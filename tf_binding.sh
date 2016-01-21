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

