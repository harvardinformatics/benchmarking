#!/bin/bash

# Check for correct usage
if [ "$#" -ne 5 ]; then
    echo "Usage: $0 <CORES> <JOB_PREFIX> <INPUT_REF> <INPUT_READ1> <INPUT_READ2>"
    exit 1
fi

CORES=$1
JOB_PREFIX=$2
INPUT_REF=$3
INPUT_READ1=$4
INPUT_READ2=$5

# Submit the SLURM job and output the job ID
sbatch <<EOL
#!/bin/bash
#SBATCH --job-name=${JOB_PREFIX}_${CORES}
#SBATCH --output=logs/${JOB_PREFIX}_%j.out
#SBATCH -p holy-smokes
#SBATCH --time=2-00:00:00
#SBATCH --cpus-per-task=${CORES}
#SBATCH --mem=24G

# Load minimap 
module load python
conda activate minimap

# Run minimap for paired-end reads
minimap2 -t ${CORES} -o output/${JOB_PREFIX}_${CORES}.sam -ax sr ${INPUT_REF} ${INPUT_READ1} ${INPUT_READ2}
EOL