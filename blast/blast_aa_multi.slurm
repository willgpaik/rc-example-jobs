#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --mem=5gb
#SBATCH --time=00:10:00
#SBATCH --job-name=blast_aa_multi
#SBATCH --error=blast.aa.multi.%J.err
#SBATCH --output=blast.aa.multi.%J.out

module purge
module load blast

cp yeast.aa ~/scratch
cp yeast.aa.fasta ~/scratch

makeblastdb -in ~/scratch/yeast.aa -dbtype prot -out ~/scratch/yeast.aa.db

blastp -db ~/scratch/yeast.aa.db -query ~/scratch/yeast.aa.fasta -out ~/scratch/blast_aa_multi.alignments -num_threads $SLURM_NTASKS_PER_NODE
cp ~/scratch/blast_aa_multi.alignments .
