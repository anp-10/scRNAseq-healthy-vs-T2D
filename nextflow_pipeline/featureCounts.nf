nextflow.enable.dsl = 2

params.bams   = "results/star/*.bam"
params.gtf    = "data/genome/Homo_sapiens.GRCh38.109.gtf.gz"
params.threads = 8
params.outdir = "${projectDir}/../results/featurecounts"

process FeatureCounts {
    publishDir params.outdir, mode: 'copy'
    conda "${projectDir}/../envs/featurecounts.yml"
    
    input:
        path bam_files
        path gtf
    
    output:
        path "gene_counts.txt"
        path "gene_counts.txt.summary"
    
    script:
        // Join BAM files with spaces for the command
        def bam_list = bam_files instanceof List ? bam_files.join(' ') : bam_files
        """
        featureCounts \
          -a ${gtf} \
          -t exon \
          -g gene_id \
          -T ${params.threads} \
          -o gene_counts.txt \
          ${bam_list}
        """
}
