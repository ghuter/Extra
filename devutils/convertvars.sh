#!/bin/sh

#----------------------------------------------------------------------------------
# Project Name      - Extra/devutils/convertvars.sh
# Started On        - Wed 27 Nov 16:51:42 GMT 2019
# Last Change       - Fri  6 Dec 03:28:05 GMT 2019
# Author E-Mail     - terminalforlife@yahoo.com
# Author GitHub     - https://github.com/terminalforlife
#----------------------------------------------------------------------------------
# Do not run this! It's a developer tool I'm sharing in-case somebody has a similar
# problem to which they need a solution, one of which he or she perhaps found here.
#
# However...
#
# Usage: convertvars.sh [FILE]
#
# Assumptions:
#
#   * You have AWK available in PATH.
#----------------------------------------------------------------------------------

. /usr/lib/tflbp-sh/ChkDep

ChkDep awk

set -- ubuntu-syschk

# Compile a unique, sigil-omitted list of uppercase-only variable names.
VarList(){
	awk -SP '
		{
			for(F=0; F<NF; F++){
				if($F~/^\$[A-Z_]+$/){
					A[$F]++
				}
			}
		}

		END {
			for(I in A){
				X=substr(I, 2, length(I))
				printf("%s\n", X)
			}
		}
	' "$1"
}

VarList "$1"
