#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use feature qw(say);

binmode STDIN,  ":encoding(UTF-8)";    # 標準入力
binmode STDOUT, ":utf8";               # 標準出力
binmode STDERR, ":utf8";               # 標準エラー出力

use Data::Dumper::Concise;

use Encode;

# my $in = $out eq "" ? 'empty' : '';

my $out = '';
my $in;
my $in = if ($out eq "") {
  'empty';
}
else {
  p'';
}

print "$in\n";
