#! usr/bin/perl

use warnings;
use strict;
use Bio::DB::Fasta;
use Getopt::Long;

my $gene='';
GetOptions('gene:s' => \$gene);

# read databses in with a Bioperl module
my $proteome_db=Bio::DB::Fasta->new("./databases/at_representative_gene_peps.fa");
my $cds_db=Bio::DB::Fasta->new("./databases/at_representative_gene_cdses.fa");
my $cdna_db=Bio::DB::Fasta->new("./databases/at_representative_gene_cdnas.fa");
my $genomic_db=Bio::DB::Fasta->new("./databases/at_representative_gene_seqs.fa");

#find AGI for any known genes and read this infor into a hash

my %gene_to_agi=();
my @protein_ids=$proteome_db->ids;

foreach my $id(@protein_ids){

	# for the Arabidopsis proteome database, the header contains the infor of AGI, gene name (Symbols), 
	# molceular funciton, and physical information on the genome
	my $header=$proteome_db->header($id);
	my @infor=split / \| /,$header;

	my $symbols=$infor[1];
	$symbols=~s/Symbols: //g;
	
	#not all the genes are functionally known. We only read thorough the genes with known name(s)
	
	if($symbols){
		
		#some genes have multiple names that are separated with a comma.
		my @symbols=split /\, /,$symbols;
		foreach my $symbol(@symbols){
			$gene_to_agi{$symbol}=$id;
					}
			}

		}
#find the infor of a gene ($gene) of your interest (entered by your perl command with the funciton "-gene"

my $agi=$gene_to_agi{$gene};

my $header=$proteome_db->header($agi);
my @infor=split / \| /,$header;
my $gene_function=$infor[2];
my $protein_length=$proteome_db->length($agi);
my $cds_length=$cds_db->length($agi);
my $cdna_length=$cdna_db->length($agi);
my $genomic_seq_length=$genomic_db->length($agi);

my ($chr,$start,$end,$strand)=($infor[3]=~/chr(\d)\:(\d+)\-(\d+) (REVERSE|FORWARD) /);

print "gene_name=",$gene,"\n";
print "gene_AGI=",$agi,"\n";
print "gene_function=",$gene_function,"\n";
print "protein_seq_length=",$protein_length,"\n";
print "coding_sequence_length=",$cds_length,"\n";
print "cDNA_length=",$cdna_length,"\n";
print "genomic_seq_length=",$genomic_seq_length,"\n";
print "genome_location:","Chromosome=Chr",$chr,"\t","Start=",$start,"\t","End=",$end,"\t","Strand=",$strand,"\n";

exit;





