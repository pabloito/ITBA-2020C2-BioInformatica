#El script lee la secuencia del gen LMNA en formato GenBank,
#traduce las secuencias en sus 6 distintas variantes y luego guarda esto en formato #FASTA.
#Ejecutar este .pm desde la consola.

use strict;
use warnings;
use Bio::SeqUtils;
use Bio::SeqIO;
use Bio::DB::GenBank;

my $gb_input;
my $seqObj;
my $out;
my @frames;

# INput
$gb_input = Bio::SeqIO->new(-file=> "psen1.gb", -format => "genbank", -alphabet => "rna");

# Lectura
$seqObj = $gb_input->next_seq();

# Output
$out = Bio::SeqIO->new(-file=> '>psen1orig.fasta', -format => 'fasta');

# 6 frames
@frames = Bio::SeqUtils->translate_6frames($seqObj);

# Guardo mi variable en archivo de salida
$out->write_seq(@frames);
