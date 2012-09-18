#!/usr/bin/env perl
use utf8;
use Mojolicious::Lite;

get '/' => sub {
  my $self = shift;
  $self->stash(string => 'ストリング', title => 'タイトル');
  $self->render('index');
};

app->start;
__DATA__

@@ index.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= $title %></title></head>
  <body><%= $string %></body>
</html>
