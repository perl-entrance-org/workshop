use strict;
use warnings;
use utf8;

binmode STDIN, ":encoding(UTF-8)";
binmode STDOUT, ":utf8";
binmode STDERR, ":utf8";

for my $num (0..99) {
	next if(($num % 3) == 0);
	#if(($num % 3) == 0) {
	#	next;
	#}
	print "$num\n";
	if($num == int rand(100)) {
		print "オモロー!\n";
		last;
	}
}

