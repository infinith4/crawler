#!/usr/bin/perl
use strict;
use warnings;

my @twitter_trends_command = ('ruby', 'twitter/twitter_trends_capybara.rb');

while(1){
    my $ret = system @twitter_trends_command;
    if ($ret != 0) {
        print "code[$ret]\n";
    }
    sleep(12);
}
