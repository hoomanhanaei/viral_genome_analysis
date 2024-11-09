process trimmomatic {
    // Creates conda env for trimmomatic
    conda "/home/viral_genome_analysis/configs/trimmomatic.yaml"
    // specifies the output directory
    publishDir "/home/hooman/work/output_dir", mode: "move"
    
    input:
    // Expect paired-end files: R1 and R2
    tuple val(sample_id), file(reads)

    output:
    // Output trimmed files for both R1 and R2
    tuple val(sample_id),
    file("trimmed_reads/${sample_id}_trimmed_R1.fastq.gz"),
    file("trimmed_reads/${sample_id}_trimmed_R2.fastq.gz"),
    file("trimmed_reads/${sample_id}_unpaired_R1.fastq.gz"),
    file("trimmed_reads/${sample_id}_unpaired_R2.fastq.gz")

    script:
    """
    echo 'Creating Conda environment and installing dependencies...'

    # Ensure the output directory exists
    mkdir -p trimmed_reads

    echo 'Running Trimmomatic on paired-end reads...'

    trimmomatic PE ${reads[0]} ${reads[1]} \
        trimmed_reads/${sample_id}_trimmed_R1.fastq.gz \
        trimmed_reads/${sample_id}_unpaired_R1.fastq.gz \
        trimmed_reads/${sample_id}_trimmed_R2.fastq.gz \
        trimmed_reads/${sample_id}_unpaired_R2.fastq.gz \
        ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 SLIDINGWINDOW:4:20 MINLEN:36
    """
}
