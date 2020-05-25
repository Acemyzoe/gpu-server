
# gpu-server

使用docker轻松地搭建多人共享的GPU服务器。

# 介绍

CUDA是由NVIDIA开发的用于图形处理单元（GPU）上的通用计算的并行计算平台和编程模型。借助CUDA，开发人员可以利用GPU的强大功能大大加快计算应用程序的速度。

本镜像基于CUDA在Ubuntu18.04平台的镜像，安装了tensorflow，anaconda，修改了镜像源，配置好了ssh。可以更轻松地搭建多人共享GPU服务器。

# 标签

- [ubuntu18.04 (基于 nvidia/cuda:10.1-cudnn7-runtime-ubuntu18.04)](https://github.com/acemyzoe/gpu-server/blob/master/dist/tensorflow/Dockerfile)

# 如何使用

## 使用``docker``

将默认SSH端口22映射到宿主机6000端口，允许使用所有GPU资源：

```bash
docker run -dit -p 6000:22 --gpus all --name container gpu-server:tagname 
```

---

使用SSH远程登录，默认用户名`root`，密码`root`，登录后请尽快修改密码：

```bash
ssh root@host -p 6000
```

激活conda环境：

```bash
conda activate py37
```

# 自行构建

```bash
#安装docker
curl -sSL https://get.daocloud.io/docker | sh 
#安装nvidia-docker，见reference
#克隆本项目构建docker镜像(视网络情况，有可能失败，推荐直接pull)
git clone https://github.com/acemyzoe/gpu-server.git
cd gpu-server/dist/{tagname}
docker image build -t <image-name>:<tagname> .
```

# PULL FROM ALIYUN

```bash
#docker镜像已上传至阿里云深圳服务器
sudo docker pull registry.cn-shenzhen.aliyuncs.com/acemyzoe/gpus-server:v2.0
```



# Reference

- [https://mirrors.tuna.tsinghua.edu.cn](https://mirrors.tuna.tsinghua.edu.cn)
- [https://github.com/NVIDIA/nvidia-docker](https://github.com/NVIDIA/nvidia-docker)
- [docker指令](https://acemyzoe.github.io/_posts/2020-04-29-Docker-&-GPU-server/)
