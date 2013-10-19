pp-suid
=======

DESCRIPTION

   App::PAR::Packer (pp) patched for creation of binaries that can run suid

DISCLAIMER

   Because this software helps you build suid binaries from Perl code, there
   is an inherent and unavoidable security risk which YOU ALONE ARE ASSUMING.
   The risk can be mitigated by writing secure Perl code that enforces its
   own limitation on the suid executable.  An example is provided.

   The author(s) assume no responsibility and no liability for any results
   (good or bad) that come from your using this software.  We are not legally
   responsible for anything you do with this code.

   Required reading: See LICENSE file for full details.

INSTRUCTIONS

   You can read the blog howto article about this software
   http://www.atrixnet.com/compiled-perl-binaries-encrypted-and-suid

   Look at the source of each file in this distribution for a description of
   that file and its usage.

PREREQUISITES

   The USAGE example below assumes you have installed cpanm (App::cpanminus)

   It isn't mandatory, but all of this will be easier and safer if you use
   a perlbrew for this (http://www.perlbrew.pl)

   It is expected that you are running Perl 5.014 or better

   It is expected that you are running Linux (or maybe Win cygwin or a Mac)

   It is expected that you can run sudo and gain root privs on your system

USAGE

   # Don't be a moron who just copies and pastes this.  Read it _all_.  Then
   # start by editing example_script.pl, replacing "tommy" with your username

   # Get the patched code for App::PAR::Packer and example usage files
   $ git clone https://github.com/tommybutler/pp-suid.git && cd pp-suid

   # Get all prereqs installed, after which we install patched version below
   $ cpanm pp Filter::Crypto

   # Unpack the patched distribution
   $ tar xzf PAR-Packer-1.015-patched-for-suid.tgz

   # Enter the source directory for the distribution
   $ cd PAR-Packer-1.015-patched-for-suid/

   # Make the distribution, and test it
   $ perl Makefile.pl && make test # correct any errors before continuing!

   # If you have a perlbrew or local::lib, omit "sudo" from the command below
   $ sudo make install # install patched version of App::PAR::Packer and pp

   # You can stop at this point, unless you want help getting started

   # Go back to the directory with the example files in it
   $ cd ..

   # Make the example files executable
   $ chmod +x ./exec_wrapper.sh ./build.sh

   # Build an SUID binary (make sure you read and customized the script first)
   $ ./build.sh example_script.pl

   # Prepare to run the SUID binary (customize this with your own info)
   $ run_as='name of user whose ID you want to assume' # example: run_as=john

   # Run the SUID binary with the wrapper script to avoid segfaults
   $ ./exec_wrapper.sh ./example_script $run_as

CODE ORIGIN

   Get original, un-patched distribution from
   https://metacpan.org/module/App::Packer::PAR

SUPPORT

   You're on your own.  This code is unsupported and not guaranteed in any way.
   Just have fun and be code safely =)
