# viral_genome_analysis
Bioinformatics pipeline

# Viral Genome Analysis Pipeline

This repository contains a Nextflow pipeline for analyzing viral genomes in cell culture samples, starting from Illumina-sequenced data in FASTQ format. The pipeline is organized into modular files for ease of maintenance and reusability.

```
## Project Structure

viral_genome_analysis/
├── workflows/
│   └── main.nf             # Main pipeline script
├── modules/
│   ├── fastqc.nf           # Module for FastQC process
│   ├── cutadapt.nf         # Module for Cutadapt process
│   ├── bowtie2.nf          # Module for Bowtie2 process
│   └── kraken2.nf          # Module for Kraken2 process
├── data/                   # Directory for input FASTQ files
├── results/                # Directory for output results
│   ├── fastqc_out/         # FastQC output files
│   ├── trimmed_reads/      # Trimmed reads from Cutadapt
│   ├── no_host/            # Host-filtered reads from Bowtie2
│   └── taxonomy_output/    # Taxonomic classification results from Kraken2
└── nextflow.config         # Configuration file
```
