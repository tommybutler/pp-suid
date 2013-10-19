#!/usr/bin/env perl

# Modify the source below, and replace "tommy" with your username

use 5.014;
use strict;
use warnings;

BEGIN
{
   my $allowed_user = 'tommy';

   say "Abort.  Permission denied.  You are not $allowed_user"
      and exit 1 unless getpwuid( $< ) eq $allowed_user;
}

use POSIX qw( );

my $run_as = shift @ARGV;

exit if $run_as && $run_as eq '-init';

say 'Please call me with a valid uid' and exit 1 unless $run_as;

my ( $run_uid, $run_gid ) = ( getpwnam $run_as )[ 2, 3 ]
   or say "I tried to getpwnam( $run_as ) but croaked: $!" and exit 1;

say "Tried to getpwnam $run_as but got " . $!
   and exit 1 unless $run_uid && $run_gid;

say sprintf 'I am running as %s/%s', getpwuid( $< ), get_gid();

POSIX::setgid( $run_gid ) or say 'Tried to setgid but got ' . $! and exit 1;
POSIX::setuid( $run_uid ) or say 'Tried to setuid but got ' . $! and exit 1;

say 'I just changed UID/GID';

# You have to get the gid before uid or it breaks; possible perl bug?
say sprintf 'I am running as %s/%s', getpwuid( $< ), get_gid();

exit;

sub get_gid { +( getgrgid( $( ) )[0] }
