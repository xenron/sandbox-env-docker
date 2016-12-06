FROM ubuntu:14.04

MAINTAINER caffe-maint@googlegroups.com

ENV BASEPATH="/opt"

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
    sed -i 's/read input$/input=""/g' install.sh && \
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
    echo "export PATH=/usr/local/cuda/bin/:\$PATH; export LD_LIBRARY_PATH=/usr/local/cuda/lib64/:\$LD_LIBRARY_PATH; " >>~/.bashrc && source ~/.bashrc

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
