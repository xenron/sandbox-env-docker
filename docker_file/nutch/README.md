```bash

docker build -t xenron/nutch -f Dockerfile .

docker run -itd --name nutch -h nutch xenron/nutch bash

docker exec -it nutch bash

```

