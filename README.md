pp-suid
=======

DESCRIPTION

   App::PAR::Packer (pp) patched for creation of binaries that can run suid

INSTRUCTIONS

   Read full instructions at
   http://www.atrixnet.com/compiled-perl-binaries-encrypted-and-suid

   Look at the source of each file in this distribution for a description of
   that file and its usage.

PREREQUISITES

   The USAGE example below assumes you have installed cpanm (App::cpanminus)

   It isn't mandatory, but all of this will be easier and safer if you use
   a perlbrew for this (http://www.perlbrew.pl)

   It is expected that you are running Perl 5.014 or better

USAGE

   # Don't be a moron who just copies and pastes this.  Read it all.  Then
   # start by editing example_script.pl, replacing "tommy" with your username

   # Gets all prereqs installed, after which we install patched version below
   $ cpanm pp Filter::Crypto

   $ tar xzf PAR-Packer-1.015-patched-for-suid.tgz

   $ cd PAR-Packer-1.015-patched-for-suid/

   $ perl Makefile.pl && make test # correct any errors before continuing!

   # If you have a perlbrew or local::lib, omit "sudo" from the command below
   $ sudo make install

   $ cd ..

   $ chmod +x ./exec_wrapper.sh ./build.sh

   $ ./build.sh example_script.pl

   $ run_as='name of user whose ID you want to assume' # example: run_as=john

   $ ./exec_wrapper.sh ./example_script $run_as

CODE ORIGIN

   Get original, un-patched distribution from
   https://metacpan.org/module/App::Packer::PAR

DISCLAIMER

The example files in this repository assume you have a Perl that is
version 5.014 or greater.  They assume you're running this code on Linux.
They assume you know what you're doing and that you're writing safe code.
The author(s) assume no responsibility and no liability for any results
(good or bad) that come from your using this software.  We are not legally
responsible for anything you do with this code.

See LICENSE file for further details.
