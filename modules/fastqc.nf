//nextflow

// modules/fastqc.nf

process fastqc {
	conda "bioconda::fastqc"

	input:
	path reads from read_channel

	output:
	path "fastqc_out" into fastqc_results

	script:
	"""
	mkdir -p fatsqc_out
	fastqc -o fastqc_out $reads
	"""
}
