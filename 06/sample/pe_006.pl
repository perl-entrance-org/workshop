#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use feature qw(say);

use Encode;

use Data::Dumper::Concise;

open my $fh, '<', 'japanese.txt' or die;
while (my $line = <$fh>) {
  chomp $line;
  $line = Encode::decode_utf8($line);
  print "OK\n" if $line eq '日本語';
  $line = Encode::encode_utf8($line);
  print "$line\n";
}
close $fh;

