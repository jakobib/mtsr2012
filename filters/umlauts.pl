#!/usr/bin/perl
# Yes, there should be a better way (by switching to XeTeX)!
use utf8;

my %replace = (
    'ä' => '\"{a}',
    'ö' => '\"{o}',
    'ü' => '\"{u}',
    'ß' => '\ss',
);

binmode *STDIN, ':utf8';
$/ = undef;
my $tex = <>;
$tex =~ s/([äöüß])/$replace{$1}/mges;
print $tex;

