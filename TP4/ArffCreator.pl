#!/usr/bin/perl

use strict;
use warnings;

my $file = 'articles.10p.txt';
my $wordsfile = 'mots.lst';

my @words = ();

open my $words, $wordsfile or die "Could not open $file: $!";
open (my $arff, '>articles.10p.arff');

print $arff "\@relation articles.symbolic\n\n";

while( my $line = <$words>)  {   
    print $line;
    chomp $line;
    push(@words, $line);

    print $arff "\@attribute $line {present, absent}\n"
}

print $arff "\n\@data\n";

open my $info, $file or die "Could not open $file: $!";

while( my $line = <$info>)  {   

    my $i = 0;
    foreach(@words) {
    	if($line =~ /\s*$_\s*/) {
    		print $arff "present";
    	} else {
    		print $arff "absent";
    	}

    	if ($i < $#words) {
    		print $arff ",";
    	}

    	$i++;
    }

    print $arff "\n";
}

close $arff;
close $wordsfile;
close $info;