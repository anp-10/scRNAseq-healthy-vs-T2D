#!/usr/bin/env nextflow
nextflow.enable.dsl=2

params.reads  = "${projectDir}/../data/fastq/*.fastq.gz"
params.gtf    = "${projectDir}/../data/genome/Homo_sapiens.GRCh38.109.gtf.gz"
params.outdir = "${projectDir}/../results"

include { FASTQ_PROCESSING } from './fastq_processing.nf'
include { STAR_Align } from './star_align.nf'
include { FeatureCounts } from './featureCounts.nf'

workflow {
    // Channel of raw FASTQ files
    reads_ch = Channel.fromPath(params.reads, checkIfExists: true)
                      .map { file -> tuple(file.simpleName, file) }
    
    // Trim/Filter
    FASTQ_PROCESSING(reads_ch)
    
    // Align using STAR
    STAR_Align(FASTQ_PROCESSING.out.processed_reads)
    
    // FeatureCounts - extract just the BAM files (second element of tuple)
    bam_ch = STAR_Align.out
                .map { sample_id, bam -> bam }
                .collect()
    
    FeatureCounts(bam_ch, file(params.gtf))
}
