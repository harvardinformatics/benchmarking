#!/bin/bash
#SBATCH -c 10                # Number of cores
#SBATCH -N 1
#SBATCH -t 0-08:00          # Runtime in D-HH:MM, minimum of 10 minutes
#SBATCH -p test   # Partition to submit to
#SBATCH --mem=24G           # Memory pool for all cores (see also --mem-per-cpu)

source ~/mambaforge/bin/activate minimap

echo "Using 10 core:"

time minimap2 -t 10 -o c10.sam -ax sr ecoli_k12.fasta SRR31129159_1.fastq SRR31129159_2.fastq
