#!/bin/bash -l

#SBATCH --job-name=gpu
#SBATCH -q debug -C gpu
#SBATCH --gres=gpu:1
#SBATCH --ntasks=1
#SBATCH --time=00:30:00
#SBATCH --output=gpu_pawsey.out

export PODMANHPC_ADDITIONAL_STORES=/pscratch/shifter/podman/

image="nvcr.io/hpc/gromacs:2018.2"

# uncompress configuration input file
if [ -e conf.gro.gz ] ; then
 gunzip conf.gro.gz
fi


# run Gromacs preliminary step with container
# GPU is enabled by default with Shifter at NERSC
srun podman-hpc run --rm --gpu -v `pwd`:`pwd` -w `pwd` $image \
    gmx grompp -f pme.mdp

# Run Gromacs MD with container
# GPU is enabled by default with Shifter at NERSC
srun podman-hpc run --rm --gpu -v `pwd`:`pwd` -w `pwd` $image \
    gmx mdrun -ntmpi 1 -nb gpu -pin on -v -noconfout -nsteps 5000 -s topol.tpr -ntomp 1
