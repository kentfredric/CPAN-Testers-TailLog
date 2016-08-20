use 5.006;    # our
use strict;
use warnings;

package CPAN::Testers::TailLog::Result;

our $VERSION = '0.001000';

# ABSTRACT: A single log entry from metabase.cpantesters.org

# AUTHORITY

sub new { bless $_[1], $_[0] }

sub accepted    { $_[0]->{accepted} }
sub filename    { $_[0]->{filename} }
sub grade       { $_[0]->{grade} }
sub perlversion { $_[0]->{perlversion} }
sub platform    { $_[0]->{platform} }
sub reporter    { $_[0]->{reporter} }
sub submitted   { $_[0]->{submitted} }
sub uuid        { $_[0]->{uuid} }

1;

