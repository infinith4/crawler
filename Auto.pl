#!/usr/bin/perl
use strict;
use warnings;

my @command = ('ruby', 'google_trends/google_trends_words.rb');

while(1){
    my $ret = system @command;
    if ($ret != 0) {
        print "code[$ret]\n";
    }
    sleep(1200);
}
