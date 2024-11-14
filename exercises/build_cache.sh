#!/bin/bash

cd /tmp
[ -e ubuntu20.04_latest.sif ] || singularity pull docker://ecpe4s/ubuntu20.04
[ -e blast_2.9.0--pl526h3066fca_4.sif ] || singularity pull docker://quay.io/biocontainers/blast:2.9.0--pl526h3066fca_4
[ -e sc22-openfoam_v2012.sif ] || singularity pull docker://quay.io/pawsey/sc22-openfoam:v2012

chmod a+r *sif

if [ ! -e /tmp/shared ] ; then
	podman-hpc --squash-dir=/tmp/shared pull docker.io/library/centos:8
	chmod -R a+rwx /tmp/shared
	podman-hpc rmi docker.io/library/centos:8
fi
