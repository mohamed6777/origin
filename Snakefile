rule all:
    input:
        "variants_filtered/{sample}.fil.vcf"
rule annotate_variants:
    input:
        "variants/{sample}.vcf"
    output:
        "variants_filtered/{sample}.fil.vcf"
    shell:
       "snpeff -Xmx8g -v hg19kg {input} | "
       "snpSift annotate -exists -v /fast/projects//cubit/work/18.12/static_data/db/gnomAD/release2.0.2/GRCh37/gnomad.exomes.r2.0.2.sites.vcf.gz /dev/stdin | "
       "snpsift filter -n ' (exists ID) & !( ID = 'ExAC' )' /dev/stdin > {output}"
#man git is cool


#change to be merged