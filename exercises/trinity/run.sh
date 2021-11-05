#!/bin/bash

image="docker://trinityrnaseq/trinityrnaseq:2.8.6"

# create overlay
export COUNT="200"
export BS="1M"
export FILE="my_overlay"
singularity exec docker://ubuntu:18.04 bash -c " \
  mkdir -p overlay_tmp/upper overlay_tmp/work && \
  dd if=/dev/zero of=$FILE count=$COUNT bs=$BS && \
  mkfs.ext3 -d overlay_tmp $FILE && \
  rm -rf overlay_tmp"

# create output directory in overlay
OUTPUT_DIR="/trinity_out_dir"
singularity exec --overlay my_overlay docker://ubuntu:18.04 mkdir $OUTPUT_DIR

# run analysis in overlay
singularity exec --overlay my_overlay $image \
  Trinity \
  --seqType fq --left trinity_test_data/reads.left.fq.gz  \
  --right trinity_test_data/reads.right.fq.gz \
  --max_memory 1G --CPU 1 --output $OUTPUT_DIR
