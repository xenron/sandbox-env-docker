# 1. Run prebuild.sh to checkout and build an archive of the OpenCV 3.1.0 source
# 2. Run build.sh to build the docker image

# Ubuntu 14.04
# Opencv 3.1
# Caffe latest

# For CPU
docker build -t xenron/caffe:14.04-cpu -f cpu.Dockerfile .
# For GPU
docker build -t xenron/caffe:14.04-gpu -f gpu.Dockerfile .
