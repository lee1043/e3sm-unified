#!/bin/bash

set -e

rm -rf ~/mambaforge/conda-bld
upload=False
dev=True

if [ $dev == "True" ]
then
  channels="-c conda-forge/label/zstash_dev \
            -c conda-forge/label/zppy_dev \
            -c conda-forge"
else
  channels="-c conda-forge"
fi

for file in configs/mpi_mpich_python3.10.yaml configs/mpi_hpc_python3.10.yaml
# for file in configs/mpi_*_python*.yaml
do
  conda mambabuild -m $file --override-channels --use-local $channels .
done

if [ $upload == "True" ]
then
   anaconda upload -u e3sm ${HOME}/miniconda3/conda-bld/linux-64/e3sm-unified-*.tar.bz2
fi
