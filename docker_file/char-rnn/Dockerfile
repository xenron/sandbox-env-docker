# Start with Ubuntu base image
FROM ubuntu:14.04
<<<<<<< HEAD
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install git, apt-add-repository and dependencies for iTorch
RUN apt-get update && apt-get install -y \
  git \
  software-properties-common \
  ipython3 \
  libssl-dev \
  libzmq3-dev \
  python-zmq \
  python-pip

# Install Jupyter Notebook for iTorch
RUN pip install notebook ipywidgets

# Run Torch7 installation scripts
RUN git clone https://github.com/torch/distro.git /root/torch --recursive && cd /root/torch && \
  bash install-deps && \
  ./install.sh

# Set ~/torch as working directory
WORKDIR /root/torch

# Export environment variables manually
ENV LUA_PATH='/root/.luarocks/share/lua/5.1/?.lua;/root/.luarocks/share/lua/5.1/?/init.lua;/root/torch/install/share/lua/5.1/?.lua;/root/torch/install/share/lua/5.1/?/init.lua;./?.lua;/root/torch/install/share/luajit-2.1.0-beta1/?.lua;/usr/local/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?/init.lua'
ENV LUA_CPATH='/root/.luarocks/lib/lua/5.1/?.so;/root/torch/install/lib/lua/5.1/?.so;./?.so;/usr/local/lib/lua/5.1/?.so;/usr/local/lib/lua/5.1/loadall.so'
ENV PATH=/root/torch/install/bin:$PATH
ENV LD_LIBRARY_PATH=/root/torch/install/lib:$LD_LIBRARY_PATH
ENV DYLD_LIBRARY_PATH=/root/torch/install/lib:$DYLD_LIBRARY_PATH
ENV LUA_CPATH='/root/torch/install/lib/?.so;'$LUA_CPATH

RUN luarocks install nngraph
RUN luarocks install optim
RUN luarocks install nn
RUN cd / && git clone https://github.com/karpathy/char-rnn.git

WORKDIR /char-rnn
=======

MAINTAINER caffe-maint@googlegroups.com

ENV BASEPATH="/opt"

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        linux-generic \
        cmake \
        git \
        wget \
        vim \
        ssh \
        curl \
        php5-curl \
        libcurl4-openssl-dev \
        software-properties-common && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt

# https://github.com/karpathy/char-rnn
RUN curl -s https://raw.githubusercontent.com/torch/ezinstall/master/install-deps | bash

# and enter "yes" at the end to modify your bashrc
RUN git clone https://github.com/torch/distro.git /opt/torch --recursive && \
    cd /opt/torch && \
    sed -i 's/read input/input=$DEFAULT/g' /opt/torch/install.sh && \
    ./install.sh && \
    source ~/.bashrc

RUN luarocks install nngraph && \
    luarocks install optim && \
    luarocks install nn

# https://developer.nvidia.com/cuda-downloads
RUN cd /opt/ && \
    wget https://developer.nvidia.com/compute/cuda/8.0/prod/local_installers/cuda-repo-ubuntu1404-8-0-local_8.0.44-1_amd64-deb && \
    sudo dpkg -i cuda-repo-ubuntu1404-8-0-local_8.0.44-1_amd64-deb

RUN sudo apt-get update && \
    sudo apt-get install cuda && \
    echo "export PATH=/usr/local/cuda/bin/:\$PATH; export LD_LIBRARY_PATH=/usr/local/cuda/lib64/:\$LD_LIBRARY_PATH; " >>~/.bashrc && \
    source ~/.bashrc

RUN luarocks install cutorch && \
    luarocks install cunn

# luarocks install cltorch
# luarocks install clnn
# https://github.com/hughperkins/cltorch
# https://github.com/hughperkins/clnn
# https://github.com/hughperkins/distro-cl

RUN cd /opt/ && \
    git clone --recursive https://github.com/hughperkins/distro -b distro-cl /opt/torch-cl && \
    cd /opt/torch-cl && \
    bash install-deps && \
    ./install.sh

RUN th train.lua -gpuid -1 && \
    th train.lua -data_dir data/some_folder -rnn_size 512 -num_layers 2 -dropout 0.5 && \
    th sample.lua cv/some_checkpoint.t7 -gpuid -1 && \
    th convert_gpu_cpu_checkpoint.lua cv/lm_lstm_epoch30.00_1.3950.t7
>>>>>>> a0fd9289022aaa934ebc7f5adc1cefa504ffd906

