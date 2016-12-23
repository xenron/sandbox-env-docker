# Python 3.4

```bash

docker build -t xenron/debian -f debian.Dockerfile .

docker build -t xenron/python:python34 -f python.Dockerfile .

docker run -itd --name python34 -h caffe xenron/python:python34 bash

docker exec -it python34 bash

```

