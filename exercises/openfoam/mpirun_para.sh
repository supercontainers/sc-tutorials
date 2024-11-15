#!/bin/bash

NTASKS="2"
#image="docker://quay.io/pawsey/sc22-openfoam:v2012"
image=/tmp/sc22-openfoam_v2012.sif

# this configuration depends on the host
export MPICH_ROOT="/opt/mvapich2-x/gnu11.1.0/mofed/aws/mpirun"
export MPICH_LIBS="$( which mpirun )"
export MPICH_LIBS="${MPICH_LIBS%/bin/mpirun*}/lib64/:/tmp/lib"

export SINGULARITY_BINDPATH="$MPICH_ROOT"
export SINGULARITYENV_LD_LIBRARY_PATH="$MPICH_LIBS:\$LD_LIBRARY_PATH"


# pre-processing
singularity exec $image \
  blockMesh | tee log.blockMesh

singularity exec $image \
  topoSet | tee log.topoSet

singularity exec $image \
  decomposePar -fileHandler uncollated | tee log.decomposePar


# run OpenFoam with MPI
mpirun -n $NTASKS \
  singularity exec $image \
  simpleFoam -fileHandler uncollated -parallel | tee log.simpleFoam


# post-processing
singularity exec $image \
  reconstructPar -latestTime -fileHandler uncollated | tee log.reconstructPar

