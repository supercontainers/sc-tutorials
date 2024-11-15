#!/bin/bash

if [ -z $- ] ; then
	echo "Please source this script to set variables"
	echo ". $0"
	exit 1
fi

if ! which podman-hpc ; then
	git clone https://github.com/nersc/podman-hpc
        pip install ./podman-hpc/
fi

export PODMANHPC_HOOKS_DIR=/home/training2/.hooks.d
export PODMANHPC_MODULES_DIR=/home/training2/etc/modules.d

[ -e $PODMANHPC_HOOKS_DIR ] || mkdir $PODMANHPC_HOOKS_DIR
HT=$(which hook_tool)
cat << EOF > $PODMANHPC_HOOKS_DIR/02-hook_tool.json
{
    "version": "1.0.0",
    "hook": {
        "env": [
	    "HOME=${HOME}"
	],
	"path": "${HT}",
        "args": ["hook_tool"]
    },
    "when": {
        "annotations": {
           "podman_hpc.hook_tool": "true"
        }
    },
    "stages": ["prestart"]
}
EOF

[ -e ~/.local/bin/mksquashfs.static ] || (cd ~/.local/bin && wget https://portal.nersc.gov/project/bigdata/mksquashfs.static)

chmod a+rx ~/.local/bin/mksquashfs.static

export SCRATCH=$HOME

mkdir -p $HOME/etc/modules.d

echo /usr/lib64 > $HOME/etc/01-gpu.conf

cat << EOF > $HOME/etc/modules.d/gpu.yaml
name: gpu
cli_arg: gpu
help: Enable NVIDIA GPU Support
env: ENABLE_GPU
additional_args:
  - -e NVIDIA_VISIBLE_DEVICES
copy:
  - ../01-gpu.conf:/etc/ld.so.conf.d/02-gpu.conf
bind:
  - /usr/lib/x86_64-linux-gnu/libnv*:/usr/lib64/
  - /usr/lib/x86_64-linux-gnu/nvidia/libOpenCL*:/usr/lib64/
  - /usr/lib/x86_64-linux-gnu/libcuda*:/usr/lib64/
  - /opt/cray/pe/mpich/default/gtl/lib/libmpi_gtl_cuda*:/usr/lib64/
  - /usr/bin/nvidia-smi:/usr/bin/nvidia-smi
  - /dev/nvidiactl:/dev/nvidiactl
  - /dev/nvidia*:/dev/
  - /dev/nvidia-uvm:/dev/nvidia-uvm
  - /dev/nvidia-uvm-tools:/dev/nvidia-uvm-tools
EOF

# Build a shared area
if [ ! -e /tmp/shared ] ; then
	podman-hpc --squash-dir=/tmp/shared pull docker.io/library/centos:8
	chmod -R a+rwx /tmp/shared
	podman-hpc rmi docker.io/library/centos:8
fi

export PODMANHPC_ADDITIONAL_STORES=/tmp/shared/
