#!/bin/bash

NTASKS="2"

module load wi4mpi

e4s-cl init --profile OpenFoam --backend singularity --image sc22-openfoam_v2012.sif --wi4mpi $WI4MPI_ROOT --wi4mpi_options "-F mpich -T openmpi" --source source.sh

# pre-processing
e4s-cl mpirun -n 1 blockMesh | tee log.blockMesh

e4s-cl mpirun -n 1 topoSet | tee log.topoSet

e4s-cl mpirun -n 1 decomposePar -fileHandler uncollated | tee log.decomposePar


# run OpenFoam with MPI
e4s-cl mpirun -n $NTASKS simpleFoam -fileHandler uncollated -parallel | tee log.simpleFoam


# post-processing
e4s-cl mpirun -n 1 reconstructPar -latestTime -fileHandler uncollated | tee log.reconstructPar

e4s-cl profile delete OpenFoam
