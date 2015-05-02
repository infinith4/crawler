use strict;
use warnings;

open(IN, 'google_trends.csv');
my @words = ();
while(<IN>){
  chomp;
  my @csvArray = split(/,/, $_);
  push @words, $csvArray[1];
  
}
close(IN);
