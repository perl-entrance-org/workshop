use strict;
use warnings;
use utf8;

binmode STDIN, ":encoding(UTF-8)";
binmode STDOUT, ":utf8";
binmode STDERR, ":utf8";

my $name = 'papix';
my $twitter = '__papix__';
my @mail = qw/ papix2011@gmail.com hogehoge@fugafuga.com /;

print "MAIL:@mail\n";

# &print_data($name, $twitter, \@mail);
&print_data({
	name    => $name,
	twitter => $twitter,
	mail    => \@mail,
});

sub print_data {
	# my($name, $twitter, $mail) = @_;

	# my ($arg) = @_;
	# my $arg = shift @_;
	my $arg = shift;

	print "Name: " . $arg->{name} . "\n";
	print "Twitter: " . $arg->{twitter} . "\n";
	#print "Mail: " . join(', ', @{$arg->{mail}}) . "\n";
	print "Mail:@{$arg->{mail}}\n";
}

