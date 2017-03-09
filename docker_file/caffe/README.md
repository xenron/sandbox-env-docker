# Caffe

## build image
```bash
# For CPU
docker build -t xenron/caffe:14.04-cpu -f caffe.cpu.Dockerfile .
# For CPU & OpenCV 3.1
docker build -t xenron/caffe:14.04-cpu -f caffe_opencv.cpu.Dockerfile .
# For GPU
docker build -t xenron/caffe:14.04-gpu -f caffe.gpu.Dockerfile .
```

## start container
```bash
docker run -itd --name caffe -h caffe xenron/caffe:14.04-cpu bash
```

## Run a interactive command in the container
```bash
docker exec -it caffe bash
```

# For DeepFace

## build image
```bash
docker build -t xenron/caffe-local:14.04-cpu -f caffe-local.cpu.Dockerfile .
```

## start container
```bash
docker run -itd --name caffe-local -h caffe-local xenron/caffe-local:14.04-cpu bash
```

## Run a interactive command in the container
```bash
docker exec -it caffe-local bash

```



