#!/usr/bin/perl

use Test::More qw(no_plan);

use WWW::Shorten 'KUSO';

my $short = makeashorterlink(
   'http://www.google.com'
   );

