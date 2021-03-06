#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use feature qw(say);

binmode STDIN,  ":encoding(UTF-8)";    # 標準入力
binmode STDOUT, ":utf8";               # 標準出力
binmode STDERR, ":utf8";               # 標準エラー出力

use Data::Dumper::Concise;

my @nums = (0 .. 99);

for my $num (@nums) {
  do {
    print "$num\n";
    print "$num\n";
  } if $num == 50;
}
