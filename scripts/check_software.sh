#!/bin/bash

# Exit if any command fails
set -e

# Load system modules
module load fastqc/0.12.1
module load star/2.7.11b
module load samtools/1.21

# Confirm installation
echo "Installed tool versions:"
fastqc --version
cutadapt --version
STAR --version
multiqc --version
featureCounts -v