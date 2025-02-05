
# viral_genome_analysis
Bioinformatics pipeline

# Viral Genome Analysis Pipeline

This repository contains a Nextflow pipeline for analyzing viral genomes in cell culture samples, starting from Illumina-sequenced data in FASTQ format. The pipeline is organized into modular files for ease of maintenance and reusability.

```
## Project Structure

📂 viral_genome_analysis/
├── 📂 workflows/
│   ├── main.nf             # Main pipeline script
|   └── nextflow.config     # Configuration file
|
├── 📂 modules/
│   ├── fastqc.nf           # Module for FastQC process
│   ├── cutadapt.nf         # Module for Cutadapt process
│   ├── bowtie2.nf          # Module for Bowtie2 process
│   └── kraken2.nf          # Module for Kraken2 process
|
├── 📂 config/             # tool's dependencies
```
