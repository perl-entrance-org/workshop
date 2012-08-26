#!/usr/bin/env perl
use utf8;
use strict;
use warnings;

binmode STDIN,  ":encoding(UTF-8)";    # 標準入力
binmode STDOUT, ":utf8";               # 標準出力
binmode STDERR, ":utf8";               # 標準エラー出力

while (1) {
  print "文字を入力してください>>>";
  chomp (my $input = <STDIN>);
  if ($input eq "END") {
    last;
  }
  elsif ($input =~ /Perl/) {
    print "We love Perl!\n";
  }
  else {
    print "$input\n";
  }
}

