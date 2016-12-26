FROM ubuntu:14.04
MAINTAINER caffe-maint@googlegroups.com

RUN apt-get update && apt-get install -y --no-install-recommends \
        bc \
        build-essential \
        cmake \
        git \
        wget \
        ssh \
        unzip \
        libatlas-base-dev \
        libboost-all-dev \
        libgflags-dev \
        libgoogle-glog-dev \
        libhdf5-serial-dev \
        libleveldb-dev \
        liblmdb-dev \
        libopencv-dev \
        libprotobuf-dev \
        libsnappy-dev \
        protobuf-compiler \
        python-dev \
        python-numpy \
        python-pip \
        python-scipy \
        python-tk \
        python-skimage \
        python-opencv
#    rm -rf /var/lib/apt/lists/*

# ENV CAFFE_ROOT=/opt/caffe
# WORKDIR $CAFFE_ROOT
WORKDIR /opt/

# FIXME: clone a specific git tag and use ARG instead of ENV once DockerHub supports this.
ENV CLONE_TAG=master

# RUN git clone -b ${CLONE_TAG} --depth 1 https://github.com/BVLC/caffe.git . && \
RUN git clone https://github.com/RiweiChen/DeepFace.git && \
    cd DeepFace/resource/ && \
    unzip caffe-local.zip && \
    cd caffe-local && \
    cp Makefile.config.example Makefile.config && \
    sed -i 's/# CPU_ONLY := 1$/CPU_ONLY := 1/g' Makefile.config && \
    pip install --upgrade pip && \
    for req in $(cat python/requirements.txt) pydot; do pip install $req; done && \
#    pip install scikit-image && \
    make && \
    make pycaffe
    # cmake -DCPU_ONLY=1 .. && \
    # make -j"$(nproc)"

ENV CAFFE_ROOT=/opt/DeepFace/resource/caffe-local
ENV PYCAFFE_ROOT $CAFFE_ROOT/python
ENV PYTHONPATH $PYCAFFE_ROOT:$PYTHONPATH
ENV PATH $CAFFE_ROOT/build/tools:$PYCAFFE_ROOT:$PATH
RUN echo "$CAFFE_ROOT/build/lib" >> /etc/ld.so.conf.d/caffe.conf && ldconfig

# WORKDIR /workspace
WORKDIR /opt



