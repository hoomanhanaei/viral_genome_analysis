#!/user/bin/env nextflow
nextflow.enable.dsl=2

// Parameters (default values, can be overriden by user )
params.input = "/home/viral_genome_analysis/data/"
params.output_dir = "/home/hooman/work/output_dir"

include { trimmomatic } from "../modules/trimmomatic.nf"

workflow {
    // Used Channel.fromFilePairs to pair the fastq.gz files (R1 and R2)
    def read_channel = Channel.fromFilePairs("${params.input}*.R{1,2}_001.fastq.gz", size: 2)

	// Print the content of read_channel to check if files are loaded
	// avoid when 
    read_channel.view()

    // Run trimmomatic process with paired reads
    trimmied_reads_ch = trimmomatic(read_channel)
}
