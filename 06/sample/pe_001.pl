#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use feature qw(say);

binmode STDIN,  ":encoding(UTF-8)";    # 標準入力
binmode STDOUT, ":utf8";               # 標準出力
binmode STDERR, ":utf8";               # 標準エラー出力

use Data::Dumper::Concise;

my @array_a = ('a', 'b', 'c');
my @array_b = ('d', 'e', 'f', 'g');

my @merge_array = &merge(@array_a, @array_b);

print "merge : @merge_array\n";


sub merge {
  my (@left, @right) = @_;
  print "left  : @left\n";
  print "right : @right\n";
  return @right, @left;
}
