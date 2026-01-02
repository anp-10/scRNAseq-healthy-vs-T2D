nextflow.enable.dsl = 2

params.quality = 20
params.outdir = "${projectDir}/../results/trimmed"

process trimAndFilter {
    tag "$sample_id"
    publishDir params.outdir, mode: 'copy'
    conda "${projectDir}/../envs/cutadapt.yml"
    
    input:
        tuple val(sample_id), path(fastq)
    
    output:
        tuple val(sample_id), path("trimmed_${sample_id}.fastq.gz"), emit: processed_reads
        path "${sample_id}_cutadapt.log", emit: log
    
    script:
    """
    cutadapt -q ${params.quality} \
             --trim-n \
             --minimum-length 20 \
             -o trimmed_${sample_id}.fastq.gz \
             ${fastq} > ${sample_id}_cutadapt.log 2>&1
    """
}

workflow FASTQ_PROCESSING {
    take:
        reads_ch
    
    main:
        trimAndFilter(reads_ch)
    
    emit:
        processed_reads = trimAndFilter.out.processed_reads
}
