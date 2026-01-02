# Single-cell transcriptomic profiling of β-cells: Pipeline development & methodology validation for healthy vs T2D states

This repository contains a complete bioinformatics pipeline for analyzing scRNA-Seq data from human beta-cells to study Type 2 Diabetes (T2D). 

## Project Overview
The pipeline processes raw FASTQ files through trimming, alignment, and quantification to identify differential gene expression patterns. 

### Pipeline Stages
1. **Preprocessing**: Quality trimming using `cutadapt` via Nextflow.
2. **Alignment**: Genome indexing and read mapping using the `STAR` aligner.
3. **Quantification**: Gene-level counting using `featureCounts`.
4. **Analysis**: RPKM transformation in R and downstream visualization in Jupyter Notebook.

### Tools
- **Workflow Management**: Nextflow 25.10.2
- **Alignment**: STAR 2.7.11b
- **Quantification**: featureCounts (Subread 2.0.3)
- **QC**: cutadapt 4.4
- **Analysis**: Python 3.12, R 4.5.2
- **ML**: scikit-learn (Logistic Regression)
- **Visualization**: matplotlib, seaborn, ggplot2

## Data Sources
- **ArrayExpress**: E-MTAB-5061
- **URL**: https://www.ebi.ac.uk/arrayexpress/experiments/E-MTAB-5061/

## Reference
Segerstolpe, Å., Palasantza, A., Eliasson, P., Andersson, E. M., Andréasson, A. C., Sun, X., Picelli, S., Sabirsh, A., Clausen, M., Bjursell, M. K., Smith, D. M., Kasper, M., Ämmälä, C., & Sandberg, R. (2016). Single-Cell Transcriptome Profiling of Human Pancreatic Islets in Health and Type 2 Diabetes. Cell metabolism, 24(4), 593–607. https://doi.org/10.1016/j.cmet.2016.08.020 

**License**: MIT | **Version**: 1.0.0 | **Last Updated**: July 2025
