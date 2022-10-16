# trying nerfstudio


https://github.com/nerfstudio-project/nerfstudio

I'm using this image. ~~`nvidia/cuda:11.8.0-base-ubuntu22.04`~~

`nvidia/cuda:11.3.0-base-ubuntu20.04`
11.3.0-cudnn8-devel-ubuntu20.04 (11.3.0/ubuntu20.04/devel/cudnn8/Dockerfile)

11.3.0-devel-ubuntu20.04 (11.3.0/ubuntu20.04/devel/Dockerfile)
```
cd /workspace
mkdir temp
mkdir anaconda
mkdir git
cd temp

wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.12.0-Linux-x86_64.sh
chmod +x Miniconda3-py38_4.12.0-Linux-x86_64.sh
./Miniconda3-py38_4.12.0-Linux-x86_64.sh -b -f  -p /workspace/anaconda

export PATH="/workspace/anaconda/bin:$PATH"

# I had to move to the anaconda location to find conda
cd /workspace/anaconda/bin
./conda init bash
```

Run this code
```bash
apt-get update
apt-get install build-essential git  libgl1-mesa-glx libglib2.0-0   -y
# apt-get install  nvidia-cuda-toolkit -y

export PATH="/usr/local/cuda-11.3/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda-11.3/lib64:$LD_LIBRARY_PATH"

conda create --name nerfstudio -y python=3.8
conda activate nerfstudio
python -m pip install --upgrade pip
pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 -f https://download.pytorch.org/whl/torch_stable.html
pip install git+https://github.com/NVlabs/tiny-cuda-nn/#subdirectory=bindings/torch
```
nerf stuff
```

pip install nerfstudio
mkdir nerfstudioclone
cd nerfstudioclone
git clone https://github.com/nerfstudio-project/nerfstudio.git
ns-download-data --dataset=blender
ns-download-data --dataset=nerfstudio --capture=poster


```

ENVIROMENT is `nerfstudio`

train some code
```
ns-train vanilla-nerf
```

OR 
```
ns-train nerfacto
ns-train nerfacto --vis viewer --data data/nerfstudio/poster --viewer.websocket-port 444
ns-train nerfacto --vis viewer --data data/nerfstudio/poster --trainer.load_dir outputs/data-nerfstudio-poster/nerfacto/{timestamp}/nerfstudio_models --viewer.websocket-port 444
```


## Docker file
* trying to build it on lambda labs gpu server
1. install docker. https://docs.docker.com/engine/install/ubuntu/
2. clone this repo
3. `sudo docker build --pull --rm  -t nerfstudio1:latest .`
