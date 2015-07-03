#!/bin/perl
use strict;
my $separator = " ", my %content = (), my $count = 0, my $first = 1;
foreach my $argnum (0 .. $#ARGV) 
{
    $count = 0;
	open(DATA, "<$ARGV[$argnum]") or die "Error while opening file $ARGV[$argnum]";
	while(<DATA>)
	{
		s/\r//g; s/\n//g;
		$content{$.} .= $separator if ($first != 1);
		$content{$.} .= $_;		
		$count++;
	}
	close DATA;
	$first = 0;
}
foreach my $i (1 .. $count)
{
	print "$content{$i}\n";
}

