#!/bin/bash

# This script compiles your binary for you and runs the necessary
# commands to make it suid -- all in one go.  It runs with sudo.
# This script assumes that you are calling it with the name of the
# perl source that you want to compile and make executable.  It
# then creates the encrypted suid binary with the same name as the
# perl script (minus the ".pl" suffix).  Please name your source
# perl code with a ".pl" suffix. I.E.- foo.pl
#
# ** This script removes and overwrites any pre-existing binary
#    with the same name as its targed output file name!
#
# ** This script removes any directory in /tmp with a name that
#    starts with "par-"
#
# ** Don't put non-alphanumeric characters in your perl file name.
#
# ** This script assumes your $PATH is clean and safe
#
# ** Make sure you've installed Filter::Crypto!

perlsource="$1";

if [[ ! -e "$perlsource" ]];
then
   echo "Usage: $0 some_perl_script.pl"
   exit 1;
fi

outfile="$( echo "$perlsource" | perl -pe 's/\.pl$//' )"

if [[ "$perlsource" == "$outfile" ]];
then
   echo "Usage: $0 some_perl_script.pl"
   exit 1;
fi

sudo rm -rf /tmp/par* &&
sudo rm -rf "$outfile" &&
pp -f Crypto -F Crypto -M Filter::Crypto::Decrypt -o "$outfile" "$perlsource" &&
sudo chown root:root "$outfile" &&
sudo chmod +x "$outfile" &&
sudo chmod u+s "$outfile" &&
stat "$outfile" &&
echo "BUILD DONE: $outfile" &&
rm -rf /tmp/par*
