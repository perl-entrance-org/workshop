#!/usr/bin/env perl
use utf8;
use strict;
use warnings;

binmode STDIN,  ":encoding(UTF-8)";    # 標準入力
binmode STDOUT, ":utf8";               # 標準出力
binmode STDERR, ":utf8";               # 標準エラー出力


my @array = qw(papix john nqounet John);
push @array, "betty is good";
push @array, "Betty is good";
push @array, "papix is papix";
push @array, "papix is Good";
push @array, "tom is Good";
push @array, "TOM is Good";
push @array, "tOm is Good";
push @array, "若林 is Good";

my $qr_pattern = "(?^i:tom)";

print "$qr_pattern\n";

for my $input (@array) {
  print "$input が入力された\n";
  if ($input =~ $qr_pattern) {
    print "マッチ！\n";
  }
}

