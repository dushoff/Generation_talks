use strict;
use 5.10.0;

my $fn = $ARGV[0];
$fn =~ s/^cg//;
$fn =~ s/\.txt//;
$fn =~ tr/[a-z]/[A-Z]/;

undef $/;

my $f = <>;

my @slides = split /-{60,}/, $f;

map{
	s/./$fn $&/;
} @slides;

say join "----------------------------------------------------------------------", @slides;
