# Pawn Compiler

```
Pawn compiler 4.0.4825                  Copyright (c) 1997-2012, ITB CompuPhase

Usage:   pawncc <filename> [filename...] [options]

Options:
         -A<num>  alignment in bytes of the data segment and the stack
         -a       output assembler code
         -C<num>  cell size in bits (default=-C32)
         -c<name> codepage name or number; e.g. 1252 for Windows Latin-1
         -Dpath   active directory path
         -d<num>  debugging level (default=-d1)
             0    no symbolic information, no run-time checks
             1    run-time checks, no symbolic information
             2    full debug information and dynamic checking
             3    same as -d2, but implies -O0
         -e<name> set name of error file (quiet compile)
         -i<name> path for include files
         -k<hex>  key for encrypted scripts
         -l       create list file (preprocess only)
         -o<name> set base name of (P-code) output file
         -O<num>  optimization level (default=-O1)
             0    no optimization
             1    core instruction set (JIT-compatible)
             2    supplemental instruction set
             3    full instruction set (packed opcodes)
         -p<name> set name of the "prefix" file
         -r[name] write cross reference report to console or to specified file
         -S<num>  stack/heap size in cells (default=4096)
         -s<num>  skip lines from the input file
         -t<num>  TAB indent size (in character positions, default=8)
         -T<name> set name of the configuration file to use
         -V<num>  generate overlay code and instructions; set buffer size
         -v<num>  verbosity level; 0=quiet, 1=normal, 2=verbose (default=1)
         -w<num>  disable a specific warning by its number
         -X<num>  abstract machine size limit in bytes
         -XD<num> abstract machine data/stack size limit in bytes
         -\       use '\' for escape characters
         -^       use '^' for escape characters
         -;[+/-]  require a semicolon to end each statement (default=-)
         -([+/-]  require parantheses for function invocation (default=-)
         sym=val  define constant "sym" with value "val"
         sym=     define constant "sym" with value 0

Options may start with a dash or a slash; the options "-d0" and "/d0" are
equivalent.

Options with a value may optionally separate the value from the option letter
with a colon (":") or an equal sign ("="). That is, the options "-d0", "-d=0"
and "-d:0" are all equivalent.
```