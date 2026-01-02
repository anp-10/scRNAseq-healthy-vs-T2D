nextflow.enable.dsl=2

params.genomeDir = "${projectDir}/../data/genome/STAR_index"
params.outdir    = "${projectDir}/../results/star"

process STAR_Align_Process {
    tag { sample_id }
    publishDir params.outdir, mode: 'copy'
    conda "${projectDir}/../envs/star.yml"
    cpus 8
    memory '32 GB'
    time '6h'
    
    input:
    tuple val(sample_id), path(fastq)
    
    output:
    tuple val(sample_id), path("${sample_id}.bam")
    
    script:
    """
    STAR \
      --genomeDir ${params.genomeDir} \
      --readFilesIn ${fastq} \
      --readFilesCommand zcat \
      --runThreadN ${task.cpus} \
      --outSAMtype BAM SortedByCoordinate \
      --outTmpDir ${sample_id}_STARtmp \
      --outFileNamePrefix ${sample_id}_
    mv ${sample_id}_Aligned.sortedByCoord.out.bam ${sample_id}.bam
    """
}

workflow STAR_Align {
    take:
        input_ch
    
    main:
        STAR_Align_Process(input_ch)
    
    emit:
        STAR_Align_Process.out
}
