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

=head1 NAME

CPAN::Testers::TailLog::Result - A single log entry from
metabase.cpantesters.org

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=head2 new

=head2 accepted

=head2 filename

=head2 grade

=head2 perlversion

=head2 platform

=head2 reporter

=head2 submitted

=head2 uuid

=head1 AUTHOR

Kent Fredric <kentnl@cpan.org>

=head1 LICENSE

This software is copyright (c) 2016 by Kent Fredric.

This is free software; you can redistribute it and/or modify it under the same
terms as the Perl 5 programming language system itself.

