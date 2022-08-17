FROM pytorch/pytorch:1.12.1-cuda11.3-cudnn8-runtime

ARG USER
ARG GROUP
ARG UID
ARG GID

RUN groupadd --gid ${GID} ${GROUP}
RUN useradd --shell /bin/bash --uid ${UID} --gid ${GID} --create-home ${USER}
RUN mkdir /wd
RUN chown ${USER}:${GROUP} /wd

# SYSTEM INITIALIZATION
RUN apt update
RUN apt install git curl wget -y
RUN pip install albumentations==0.4.3
RUN pip install opencv-python==4.1.2.30
RUN pip install pudb==2019.2
RUN pip install imageio==2.9.0
RUN pip install imageio-ffmpeg==0.4.2
RUN pip install pytorch-lightning 
RUN pip install omegaconf==2.1.1
RUN pip install test-tube>=0.7.5
RUN pip install streamlit>=0.73.1
RUN pip install einops==0.3.0
RUN pip install torch-fidelity==0.3.0
RUN pip install transformers==4.19.2
RUN pip install -e git+https://github.com/CompVis/taming-transformers.git@master#egg=taming-transformers
RUN pip install -e git+https://github.com/openai/CLIP.git@main#egg=clip
RUN pip install kornia

USER ${USER}

# USER INITIALIZATION

SHELL ["/bin/bash", "--login", "-i", "-c"]
WORKDIR /home/${USER}
