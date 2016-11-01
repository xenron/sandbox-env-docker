
# Opencv 2.4
```bash
# Ubuntu 14.04
docker build -t xenron/opencv:14.04-2.4 -f opencv24.Dockerfile .
```

# Opencv 3.0
```bash
# Ubuntu 14.04
docker build -t xenron/opencv:14.04-3.0 -f opencv30.Dockerfile .
```

# Opencv 3.1
```bash
# Ubuntu 14.04
docker build -t xenron/opencv:14.04-3.1 -f opencv31-ubuntu14.04.Dockerfile .
# Ubutnu 16.04
# testing
# docker build -t xenron/opencv:16.04-3.1 -f opencv31-ubuntu16.04.Dockerfile .

# Start container
docker run -itd --name opencv -h opencv xenron/opencv:14.04-3.1 bash

# Run a interactive command in the container
docker exec -it opencv bash

