#!/bin/bash

# Array with the number of cores to test
#CORES=(1 2 4 8 16)
CORES=(4 8 16 32)

# Input files for minimap ecoli
#JOB_PREFIX="benchmark_minimap_ecoli"
#INPUT_REF="ecoli_k12.fasta"
#INPUT_READ1="SRR31129159_1.fastq"
#INPUT_READ2="SRR31129159_2.fastq"

# Input files for minimap scrubjay
JOB_PREFIX="benchmark_minimap_scrubjay"
INPUT_REF="aphWoo.v1.fa"
INPUT_READ1="PREP0311_NMeji15612A_A01v1_20908_bl_S1_L003_R1_001.fastq.gz"
INPUT_READ2="PREP0311_NMeji15612A_A01v1_20908_bl_S1_L003_R2_001.fastq.gz"

# stores the minimap output
mkdir -p output
# stores the logs
mkdir -p logs

# Iterate over each core count and submit jobs
for CORE in "${CORES[@]}"; do
  # Submit the job using submit_minimap.sh
  bash submit_minimap.sh ${CORE} ${JOB_PREFIX} ${INPUT_REF} ${INPUT_READ1} ${INPUT_READ2}
done