#!/usr/bin/env perl
use utf8;
use strict;
use warnings;

binmode STDIN,  ":encoding(UTF-8)";    # 標準入力
binmode STDOUT, ":utf8";               # 標準出力
binmode STDERR, ":utf8";               # 標準エラー出力

#my @perl_mongers = &add_perl_monger('papix', 'nqounet', 'yapc');
#print @perl_mongers;
&for_test;

sub add_perl_monger {
  my @array = @_;
#  my @new_array = map {$_." is perl monger!\n"} @array;
  my @new_array = map {
    if( $_ eq "yapc" ) {
      $_." is perl conference!\n";
    }
    else {
      $_." is perl monger!\n";
    }
  } @array;
  return @new_array;
}

sub for_test {
  my @array = qw(a b c);
  for (1 .. 10) {
    map {print "$_\n"} @array;
    print "$_\n";
  }
}
