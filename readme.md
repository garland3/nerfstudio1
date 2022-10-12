# trying nerfstudio

https://github.com/nerfstudio-project/nerfstudio

Run this code
```bash
conda create --name nerfstudio -y python=3.8
conda activate nerfstudio
python -m pip install --upgrade pip
pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 -f https://download.pytorch.org/whl/torch_stable.html
pip install git+https://github.com/NVlabs/tiny-cuda-nn/#subdirectory=bindings/torch
pip install nerfstudio
mkdir nerfstudioclone
cd nerfstudioclone
git clone https://github.com/nerfstudio-project/nerfstudio.git
ns-download-data --dataset=blender
ns-download-data --dataset=nerfstudio --capture=poster

apt-get update
apt-get install libgl1-mesa-glx libglib2.0-0 -y
```

ENVIROMENT is `nerfstudio`

train some code
```
ns-train vanilla-nerf
```