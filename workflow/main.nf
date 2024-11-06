// workflows/main.nf
nextflow.enable.dsl=2


// Include each module
include { fastqc } from '../modules/fastqc.nf'
include { trim_reads } from '../modules/cutadapt.nf'
include { host_removal } from '../modules/bowtie2.nf'
include { taxonomy_classification } from '../modules/kraken2.nf'

workflow {
    read_channel = Channel.fromPath('data/*.fastq.gz')

    // Run each process, passing output of one as input to the next
    fastqc(read_channel)
    trim_reads(fastqc_results)
    host_removal(trimmed_results)
    taxonomy_classification(no_host_results)
}
