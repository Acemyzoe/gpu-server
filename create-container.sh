#####Nidia-docker########
# Add the package repositories
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update 
sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker
#############################

###### tf容器################
docker run -it --gpus all -p 233:22 -v /home/ace/project:/myproject -w /myproject --name tf tensorflow/tensorflow:latest-gpu bash
