#!/usr/bin/perl

use strict;
use warnings;

my $file = 'articles.10p.txt';
my $wordsfile = 'mots.lst';

my @words = ();

open my $words, $wordsfile or die "Could not open $file: $!";

while( my $line = <$words>)  {   
    print $line;
    chomp $line;
    push(@words, $line);

    #print $arff "Salut\n";
    #last if $. == 2;
}



print "\n\n\n@words\n";

#exit 0;

open my $info, $file or die "Could not open $file: $!";
open (my $arff, '>>articles.10p.arff');

while( my $line = <$info>)  {   
    #print $line;

    foreach(@words) {
    	#print $_;
    	if($line =~ /\s*$_\s*/) {
    		print $arff "$_, ";
    	} else {
    		print $arff "pas" . "$_, ";
    	}
    }

    print "\n";
    last;

    #print $arff "Salut\n";
    #last if $. == 2;
}

close $arff;
close $info;