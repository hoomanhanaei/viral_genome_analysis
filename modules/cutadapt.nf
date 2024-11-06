// modules/cutadapt.nf

process trim_reads {
    conda 'bioconda::cutadapt'

    input:
    path reads from read_channel

    output:
    path "trimmed_reads" into trimmed_results

    script:
    """
    mkdir -p trimmed_reads
    cutadapt -o trimmed_reads/trimmed_$reads $reads
    """
}
