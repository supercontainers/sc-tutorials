#!/bin/bash
#SBATCH -C cpu
#SBATCH -n 2

NTASKS="2"
image="/global/common/shared/das/sif_images/sc22-openfoam_v2012.sif"

# this configuration depends on the host

# This is a bit of a hack to get some libraries updated for MPI
cp /lib64/libselinux.so.1 /tmp/
cp -a /usr/lib64/libpcre.so* /tmp/

export MPICH_ROOT="/usr/lib/shifter/mpich-2.2"
export MPICH_LIB=/opt/udiImage/modules/mpich/

export APPTAINER_BINDPATH="$MPICH_ROOT:$MPICH_LIB,/tmp,/var/spool/slurmd/"
export APPTAINERENV_LD_LIBRARY_PATH="$MPICH_LIB:$MPICH_LIB/dep:/tmp:\$LD_LIBRARY_PATH"

PATH=$PATH:/cvmfs/oasis.opensciencegrid.org/mis/apptainer/current/bin/

# Workaround
export MPICH_SMP_SINGLE_COPY_MODE=NONE

# pre-processing
apptainer exec $image \
  blockMesh | tee log.blockMesh

apptainer exec $image \
  topoSet | tee log.topoSet

apptainer exec $image \
  decomposePar -fileHandler uncollated | tee log.decomposePar


# run OpenFoam with MPI
srun -n $NTASKS \
  apptainer exec $image \
  simpleFoam -fileHandler uncollated -parallel | tee log.simpleFoam


# post-processing
apptainer exec $image \
  reconstructPar -latestTime -fileHandler uncollated | tee log.reconstructPar

