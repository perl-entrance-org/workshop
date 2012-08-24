#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use feature qw(say);

binmode STDIN,  ":encoding(UTF-8)";    # 標準入力
binmode STDOUT, ":utf8";               # 標準出力
binmode STDERR, ":utf8";               # 標準エラー出力

use Data::Dumper::Concise;

my $name    = 'nqounet';
my $twitter = 'nqounet';
my @mails   = (
  'nobu3_japan@yahoo.co.jp',
  'nqou.net@gmail.com',
  'coworking@shin-osaka.in',
);

&profile_print(
  $name,
  $twitter,
  \@mails,
);

sub profile_print {
  my ($name, $twitter, $mails) = @_;
  print qq{Name    : $name\n};
  print qq{Twitter : $twitter\n};
  print qq{Mail    : } . join(", ", @$mails) . "\n";
}
