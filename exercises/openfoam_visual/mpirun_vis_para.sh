#!/bin/bash

NTASKS="4"
export theImage="library://marcodelapierre/beta/openfoam:v2012"
export theImage="/tmp/openfoam_v2012.sif"

# this configuration depends on the host
export MPICH_ROOT="/opt/mvapich2-x/gnu11.1.0/mofed/aws/mpirun"
export MPICH_LIBS="$( which mpirun )"
export MPICH_LIBS="${MPICH_LIBS%/bin/mpirun*}/lib64/:/tmp/lib"

export SINGULARITY_BINDPATH="$MPICH_ROOT"
export SINGULARITYENV_LD_LIBRARY_PATH="$MPICH_LIBS:\$LD_LIBRARY_PATH"

./runAll.sh
