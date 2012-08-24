#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use feature qw(say);

binmode STDIN,  ":encoding(UTF-8)";    # 標準入力
binmode STDOUT, ":utf8";               # 標準出力
binmode STDERR, ":utf8";               # 標準エラー出力

use Data::Dumper::Concise;
open my $fh, '<:encoding(UTF-8)', 'japanese.txt' or die;
while (my $line = <$fh>) {
  chomp $line;
  print "OK\n" if $line eq '日本語';
  print "$line\n";
}
close $fh;

my @nihongo = ("英語",'ドイツ語');
open $fh, '>', 'nihongo.txt' or die;
print $fh "@nihongo\n";
close $fh;
