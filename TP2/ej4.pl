use strict;
use warnings;
use Bio::SearchIO;

#Para buscar en un achivo output de blast
my $rep = Bio::SearchIO->new(-format => 'blast', -file => 'blast_local');
my $r;
my $hit;
my $h;

print "Name \t Length \t %Identity\n";
while( $r = $rep->next_result ) {
	while( $hit = $r->next_hit ) {
    	while( $h = $hit->next_hsp ) {
       	if( $hit->description =~'provirus' ){
            	print $hit->name,"\t",$h->length('total'),"\t",$h->percent_identity,"\n";
        	}
    	}
	}
}
