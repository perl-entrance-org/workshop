#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use feature qw(say);

binmode STDIN,  ":encoding(UTF-8)";    # 標準入力
binmode STDOUT, ":utf8";               # 標準出力
binmode STDERR, ":utf8";               # 標準エラー出力

use Data::Dumper::Concise;

my %person;

print "名前を入力してください>>>";
chomp( $person{name}   = <STDIN> );
print "身長をcmで入力してください>>>";
chomp( $person{height} = <STDIN> );
print "体重をkgで入力してください>>>";
chomp( $person{weight} = <STDIN> );

$person{bmi} = &calc_bmi($person{height}, $person{weight});

for my $key (keys %person) {
  print "$key : $person{$key}\n";
}

sub calc_bmi {
  my ($height_cm, $weight_kg) = @_;

  my $height_m = $height_cm / 100;

  return $weight_kg / $height_m ** 2;
}
