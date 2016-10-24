#!/bin/bash

# start caffe container
# sudo docker rm -f hadoop-master &> /dev/null
echo "start caffe container..."
# docker build -t xenron/caffe:14.04-cpu -f cpu_opencv.Dockerfile .
docker run -itd --name caffe -h caffe xenron/caffe:14.04-cpu bash

# Test
/opt/caffe/data/mnist/get_mnist.sh

cd /opt/caffe
./examples/mnist/create_mnist.sh
./examples/mnist/train_lenet.sh
