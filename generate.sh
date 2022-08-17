#!/bin/bash

docker run \
    -it \
    --rm \
    --gpus all \
    -v $(pwd):/home/${USER} \
    -e PYTHONPATH=/home/${USER} \
    ${USER}_stable_diffusion \
    python scripts/generate.py "$1"
