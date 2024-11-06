// modules/bowtie2.nf


process host_removal {
    conda 'bioconda::bowtie2'

    input:
    path reads from read_channel

    output:
    path "no_host" into no_host_results

    script:
    """
    mkdir -p no_host
    bowtie2 -x host_index -U $reads -S no_host/$reads.sam
    """
}
