# Caffe latest

```bash
# For CPU
docker build -t xenron/caffe:14.04-cpu -f cpu.Dockerfile .
# For CPU & OpenCV 3.1
docker build -t xenron/caffe:14.04-cpu -f cpu-opencv.Dockerfile .
# For GPU
docker build -t xenron/caffe:14.04-gpu -f gpu.Dockerfile .

# Start container
docker run -itd --name caffe -h caffe xenron/caffe:14.04-cpu bash
# Run a interactive command in the container
docker exec -it caffe bash

```

