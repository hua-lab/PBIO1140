#! usr/bin/perl

use warnings;
use strict;
use Bio::DB::Fasta;

#read in a number of different databases using a Bioperl module
 
my $genome_db=Bio::DB::Fasta->new("./databases/at_genome.fa");
my $proteome_db=Bio::DB::Fasta->new("./databases/at_representative_gene_peps.fa");
my $cds_db=Bio::DB::Fasta->new("./databases/at_representative_gene_cdses.fa");
my $cdna_db=Bio::DB::Fasta->new("./databases/at_representative_gene_cdnas.fa");
my $gene_db=Bio::DB::Fasta->new("./databases/at_representative_gene_seqs.fa");

#find the sequence ids 

my @genome_seqs=$genome_db->ids;
my @proteome_seqs=$proteome_db->ids;
my @cds_seqs=$cds_db->ids;
my @cdna_seqs=$cdna_db->ids;
my @gene_seqs=$gene_db->ids;

#count seqs in each database

my $number_of_genome_dnas=scalar @genome_seqs;
my $number_of_proteins=scalar @proteome_seqs;
my $number_of_cdses=scalar @cds_seqs;
my $number_of_cdnas=scalar @cdna_seqs;
my $number_of_genes=scalar @gene_seqs;


#print out the result

print "number_of_genome_dnas=",$number_of_genome_dnas,"\n";
print "number_of_proteins=",$number_of_proteins,"\n";
print "number_of_CDSes=",$number_of_cdses,"\n";
print "number_of_cDNAs=",$number_of_cdnas,"\n";
print "number_of_genes=",$number_of_genes,"\n";


exit;  
