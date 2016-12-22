# Docker Pandas
docker build -t xenron/python:da -f da.Dockerfile .

docker run -itd --name python-da -h python-da xenron/python:da bash

docker exec -it python-da bash

