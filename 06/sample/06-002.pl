use strict;
use warnings;
use utf8;

binmode STDIN, ":encoding(UTF-8)";
binmode STDOUT, ":utf8";
binmode STDERR, ":utf8";

my $name = 'papix';
my $twitter = '__papix__';
my @mail = qw/ papix2011@gmail.com hogehoge@fugafuga.com /;

&view({
		name => $name,
		twitter => $twitter,
		mail => \@mail,
	});

sub view {
	#my ($arg) = @_;
	my $arg = shift;

	print "name : " . $arg->{name} . "\n";
	print "twitter : " . $arg->{twitter} . "\n";
	print "mail : " . join(',', @{$arg->{mail}}) . "\n";
	print "\n\n";
	$arg->{name}; # 実は返り値になる
}

