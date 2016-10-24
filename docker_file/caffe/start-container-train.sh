#!/bin/bash

# start caffe container

echo "start caffe container..."
# docker build -t xenron/caffe:14.04-cpu -f cpu_opencv.Dockerfile .
docker run -itd --name caffe -h caffe xenron/caffe:14.04-cpu bash
docker exec -it caffe bash

# Test
# download dataset
/opt/caffe/data/mnist/get_mnist.sh
# create ldba & train
cd /opt/caffe
./examples/mnist/create_mnist.sh
./examples/mnist/train_lenet.sh

