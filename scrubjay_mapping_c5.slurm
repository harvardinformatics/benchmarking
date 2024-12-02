#!/bin/bash
#SBATCH -c 5                # Number of cores
#SBATCH -N 1
#SBATCH -t 0-08:00          # Runtime in D-HH:MM, minimum of 10 minutes
#SBATCH -p test   # Partition to submit to
#SBATCH --mem=48G           # Memory pool for all cores (see also --mem-per-cpu)

source ~/mambaforge/bin/activate minimap

echo "Using 5 core:"

time minimap2 -t 5 -o c5.sam -ax sr aphWoo.v1.fa PREP0311_NMeji15612A_A01v1_20908_bl_S1_L003_R1_001.fastq.gz PREP0311_NMeji15612A_A01v1_20908_bl_S1_L003_R2_001.fastq.gz
