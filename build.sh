#!/bin/bash

docker build . -t ${USER}_stable_diffusion \
	--build-arg USER=${USER} \
	--build-arg GROUP=${USER} \
	--build-arg UID=$(id -u ${USER}) \
	--build-arg GID=$(id -g ${USER})

mkdir models/ldm/stable-diffusion-v1/
wget -nc https://drinkordiecdn.lol/sd-v1-3-full-ema.ckpt -O models/ldm/stable-diffusion-v1/model.ckpt
