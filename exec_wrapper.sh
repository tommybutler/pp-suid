#!/bin/bash

# Newly compiled binaries will probably segfault the first time you
# run them.  This wrapper just ignores that and makes sure the user
# doesn't get nervous about the segfault.  Basically this is achieved
# by calling the binary two times.  If you don't want to do that,
# don't use this wrapper.
#
# ** Before you compile your source code with ./build.sh, put an option
# in your source code that checks if its first argument is "-init",
# and if so immediatly exits.  Refer to the included perl source code
# as an example.  This wrapper calls your compiled script with the
# -init option on its first execution.

exec_file=$1

if [[ -z "$exec_file" ]];
then
   echo "Usage: $0 ./path/to/executable [ arg1 arg2 ...]";
   exit 1;
fi

has_path=$( echo "$exec_file" | perl -ne 'm(/) && print q(yes)' )

if [[ "$has_path" != 'yes' ]];
then
   exec_file="./$exec_file"
fi

if [[ ! -x "$exec_file" ]];
then
   echo "Usage: $0 ./path/to/executable [ arg1 arg2 ...]";
   exit 1;
fi

{ $exec_file -init 2>/dev/null ; } >/dev/null 2>&1;

shift;

$exec_file $@

exit $?
