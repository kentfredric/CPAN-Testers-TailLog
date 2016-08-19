#!perl
use strict;
use warnings;

use Time::HiRes qw( gettimeofday tv_interval sleep );
use constant refresh_period => 60;
use CPAN::Testers::TailLog;

my %seen;
my $fetcher = CPAN::Testers::TailLog->new();

while (1) {
    update();
    my $need_sleep = refresh_period;
    $need_sleep -= sleep($need_sleep) while $need_sleep > 0;

}

sub update {
    my @new;
    for my $item ( @{ $fetcher->get } ) {
        next if exists $seen{ $item->uuid };
        next if $item->grade eq 'pass';
        $seen{ $item->uuid } = 1;
        push @new, $item;
    }
    unless (@new) {
        printf "%s: \e[35m -- No Updates -- \e[0m\n", scalar localtime;
        return;
    }
    printf "\e[36m%s\e[0m:\n", scalar localtime;
    for my $item (@new) {
        my $color =
            $item->grade eq 'pass' ? "\e[1;32m"
          : $item->grade eq 'fail' ? "\e[1;31m"
          :                          "\e[33m";
        printf
"%s%10s\e[0m: %-55s ( \e[36m%-20s\e[0m on \e[35m%-40s\e[0m => \e[34m%s\e[0m )\e[0m\n",
          $color, $item->grade, $item->filename,
          $item->perlversion, $item->platform, $item->uuid;

    }
}

