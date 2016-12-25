# Caffe latest

```bash
# For CPU
docker build -t xenron/caffe:14.04-cpu -f caffe.cpu.Dockerfile .
# For CPU & OpenCV 3.1
docker build -t xenron/caffe:14.04-cpu -f caffe.cpu_opencv.Dockerfile .
# For GPU
docker build -t xenron/caffe:14.04-gpu -f caffe.gpu.Dockerfile .

# Start container
docker run -itd --name caffe -h caffe xenron/caffe:14.04-cpu bash
# Run a interactive command in the container
docker exec -it caffe bash



# For DeepFace
docker build -t xenron/caffe-local:14.04-cpu -f caffe-local.cpu.Dockerfile .

# Start container
docker run -itd --name caffe-local -h caffe-local xenron/caffe-local:14.04-cpu bash
# Run a interactive command in the container
docker exec -it caffe-local bash

```

