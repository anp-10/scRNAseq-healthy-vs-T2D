#!/bin/bash
#SBATCH --job-name=STAR_indexing
#SBATCH --partition=short        # Use the appropriate partition
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=45G
#SBATCH --time=04:00:00
#SBATCH --output=scripts/logs/index_%j.log

# Load your environment
source ~/.bashrc
conda activate star_env

# Run STAR
STAR --runThreadN 16 \
     --runMode genomeGenerate \
     --genomeDir ~/scRNA-healthy-vs-T2D/data/genome/STAR_index \
     --genomeFastaFiles ~/scRNA-healthy-vs-T2D/data/genome/Homo_sapiens.GRCh38.dna.primary_assembly.fa \
     --sjdbGTFfile ~/scRNA-healthy-vs-T2D/data/genome/Homo_sapiens.GRCh38.109.gtf \
     --sjdbOverhang 100
