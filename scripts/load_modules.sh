#!/bin/bash

echo "Loading available modules for the transcriptome pipeline..."

# Load modules that exist on Explorer
module load OpenJDK/22.0.2
module load perl/5.40.0
module load fastqc/0.12.1
module load samtools/1.21
module load nextflow/24.10.3

echo "Modules loaded:"
module list