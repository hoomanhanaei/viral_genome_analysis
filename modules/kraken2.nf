// modules/kraken2.nf


process taxonomy_classification {
    conda 'bioconda::kraken2'

    input:
    path reads from read_channel

    output:
    path "taxonomy_output" into taxonomy_results

    script:
    """
    mkdir -p taxonomy_output
    kraken2 --db kraken_db --output taxonomy_output/$reads.kreport --report taxonomy_output/$reads.report $reads
    """
}
