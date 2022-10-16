# This was for nerf-studio. had a super hard time getting this to work. still not exactly working

FROM nvidia/cuda:11.3.0-cudnn8-devel-ubuntu20.04

RUN bash -c "apt-get update; apt-get install -y wget;DEBIAN_FRONTEND=noninteractive  apt-get install openssh-server -y;mkdir -p ~/.ssh"
RUN apt-get install build-essential git  libgl1-mesa-glx libglib2.0-0   -y

WORKDIR /workspace/temp
RUN bash -c "wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.12.0-Linux-x86_64.sh; chmod +x Miniconda3-py38_4.12.0-Linux-x86_64.sh;./Miniconda3-py38_4.12.0-Linux-x86_64.sh -b -f -p /workspace/anaconda"

RUN /workspace/anaconda/bin/conda init bash


# RUN  apt-get update
# apt-get install  nvidia-cuda-toolkit -y

# RUN export PATH="/usr/local/cuda-11.3/bin:$PATH"
# RUN export LD_LIBRARY_PATH="/usr/local/cuda-11.3/lib64:$LD_LIBRARY_PATH"
ENV LD_LIBRARY_PATH="/usr/local/cuda-11.3/lib64:${LD_LIBRARY_PATH}"


#  PATH="${PATH}:/opt/gtk/bin"
ENV PATH="/workspace/anaconda/bin:/workspace/anaconda/condabin:${PATH}"
ENV PATH="/workspace/anaconda/bin:/workspace/anaconda/condabin:/usr/local/cuda-11.3/bin:${PATH}"



# RUN echo $PATH
RUN python -m pip install --upgrade pip
# RUN pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 -f https://download.pytorch.org/whl/torch_stable.html
# RUN pip install cudatoolkit
RUN conda install pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch -y
# # https://discourse.cmake.org/t/correct-use-of-cmake-cuda-architectures/1250/3
ENV TCNN_CUDA_ARCHITECTURES="52, 61, 75"
RUN pip install git+https://github.com/NVlabs/tiny-cuda-nn/#subdirectory=bindings/torch


RUN pip install nerfstudio

WORKDIR /workspace/nerfstudioclone

RUN git clone https://github.com/nerfstudio-project/nerfstudio.git
RUN ns-download-data --dataset=blender
RUN ns-download-data --dataset=nerfstudio --capture=poster