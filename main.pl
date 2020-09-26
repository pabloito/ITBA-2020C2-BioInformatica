use strict;
use warnings;
use Bio::Seq;

print "Hello, World!\n";
my $seq_obj;
$seq_obj = Bio::Seq->new(-seq        => "aaaatgggggggggggccccgtt",
                         -display_id => "#12345",
                         -desc       => "example 1",
                         -alphabet   => "dna" );

print $seq_obj->seq();