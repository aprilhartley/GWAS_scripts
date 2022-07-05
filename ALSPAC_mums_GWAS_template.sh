#!/bin/sh
#SBATCH --job-name=survival_gwas_chrtemplate
#SBATCH --time=3-00:00:00
#SBATCH -e GWAS_errorCtemplate
#SBATCH --ntasks-per-node=14
#SBATCH --nodes=1
#SBATCH -p mrcieu,mrcieu2

module add apps/snptest/2.5.2
snptest_v2.5 -data /mnt/storage/private/alspac/1/alspac/studies/latest/alspac/genetic/variants/arrays/gwas/imputed/hrc/released/2017-05-04/data/vcf/data_chr0template.dose.vcf.gz \
                   PATH_TO/MOTHERS.sample \
	     -genotype_field GP \ #need to specify the field to read the genotypes from for VCF files
             -exclude_samples /mnt/storage/private/alspac/1/alspac/studies/latest/alspac/genetic/variants/arrays/gwas/imputed/hrc/released/2015-10-30/data/derived/unrelated_ids/mothers/exclusion_list.txt \
             	# or /mnt/storage/private/alspac/1/alspac/studies/latest/alspac/genetic/variants/arrays/gwas/imputed/hrc/released/2015-10-30/data/derived/unrelated_ids/children/exclusion_list.txt for children
	     -frequentist 1 \
             -method expected \
	     -use_raw_phenotypes \ #if you don't want the phenotype scaled to mean of 0 and variance of 1
	     -pheno PHENO \
             -cov_names COVARS \
             -sex_column sex \
             -log PATH_TO.log \
             -o PATH_TO.out 
