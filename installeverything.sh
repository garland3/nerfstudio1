cd /home/root
mkdir temp
mkdir anaconda
mkdir git
cd temp
wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.12.0-Linux-x86_64.sh
chmod +x Miniconda3-py38_4.12.0-Linux-x86_64.sh
./Miniconda3-py38_4.12.0-Linux-x86_64.sh -b -f -p /home/root/anaconda
# I had to move to the anaconda location to find conda
# cd /home/root/anaconda/bin
# ./conda init bash


# https://askubuntu.com/a/988191
export PATH="/home/root/anaconda/bin:$PATH"


 # LOG OUT AND BACK IN

apt-get update
apt-get install build-essential git  libgl1-mesa-glx libglib2.0-0 cmake  -y
# apt-get install  nvidia-cuda-toolkit -y

export PATH="/usr/local/cuda-11.3/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda-11.3/lib64:$LD_LIBRARY_PATH"

# ./conda create --name nerfstudio -y python=3.8
# ./conda activate nerfstudio
python -m pip install --upgrade pip
pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 -f https://download.pytorch.org/whl/torch_stable.html

cd /home/root/temp
git clone https://github.com/NVlabs/tiny-cuda-nn
cd tiny-cuda-nn
cmake . -B build
cmake --build build --config RelWithDebInfo -j
# pip install git+https://github.com/NVlabs/tiny-cuda-nn/#subdirectory=bindings/torch

cd /home/root/

pip install nerfstudio
mkdir nerfstudioclone
cd nerfstudioclone
git clone https://github.com/nerfstudio-project/nerfstudio.git
ns-download-data --dataset=blender
ns-download-data --dataset=nerfstudio --capture=poster
