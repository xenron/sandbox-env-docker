# Python 2.7

```bash

docker build -t xenron/debian -f debian.Dockerfile .

docker build -t xenron/python:27 -f python.Dockerfile .

docker run -itd --name python27 -h caffe xenron/python:27 bash

docker exec -it python27 bash

```

