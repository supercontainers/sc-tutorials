#!/bin/bash -l

#SBATCH --job-name=gpu
#SBATCH -q debug -C gpu
#SBATCH --gres=gpu:1
#SBATCH --ntasks=1
#SBATCH --time=00:30:00
#SBATCH --output=gpu_pawsey.out

# Use a cached image pull from docker://nvcr.io/hpc/gromacs:2018.2
image="/global/common/shared/das/sif_images/gromacs_2018.2.sif"

export MPICH_ROOT="/usr/lib/shifter/mpich-2.2"
export MPICH_LIB=/opt/udiImage/modules/mpich/

export SINGULARITY_BINDPATH="$MPICH_ROOT:$MPICH_LIB"
export SINGULARITYENV_LD_LIBRARY_PATH="$MPICH_LIBS:$MPICH_LIBS/dep:\$LD_LIBRARY_PATH"

export APPTAINER_CACHEDIR=$SCRATCH/.apptainer

PATH=$PATH:/cvmfs/oasis.opensciencegrid.org/mis/apptainer/current/bin/

# uncompress configuration input file
if [ -e conf.gro.gz ] ; then
 gunzip conf.gro.gz
fi


# run Gromacs preliminary step with container
srun singularity exec --nv $image \
    gmx grompp -f pme.mdp

# Run Gromacs MD with container
srun singularity exec --nv $image \
    gmx mdrun -ntmpi 1 -nb gpu -pin on -v -noconfout -nsteps 5000 -s topol.tpr -ntomp 1
