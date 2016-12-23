# Python 3.5

```bash

docker build -t xenron/debian -f debian.Dockerfile .

docker build -t xenron/python:python35 -f python.Dockerfile .

docker run -itd --name python35 -h python35 xenron/python:python35 bash

docker exec -it python35 bash

```

