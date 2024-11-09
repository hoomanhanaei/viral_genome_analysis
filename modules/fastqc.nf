/*
FastQC aims to provide a simple way to do some quality control checks
on raw sequence data coming from high throughput sequencing pipelines.
https://www.bioinformatics.babraham.ac.uk/projects/fastqc/
*/

process fastqc {

	// Creates conda env for trimmomatic
	conda "/home/viral_genome_analysis/configs/fastqc.yaml"
	// specifies the output directory
	publishDir params.output_dir, mode: "move"

	input:
	tuple val(sample_id), file(reads)

	output:
	path "fastqc_out/*"

	script:

	"""
	# Ensure the output directory exists
    mkdir -p fastqc_out

	fastqc -o fastqc_out $reads
	"""
}
