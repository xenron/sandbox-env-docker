
# PostgreSQL
```bash
# Ubuntu 14.04
docker build -t xenron/postgresql -f Dockerfile .
```

start container
```bash
docker run --name postgresql -itd --restart always --publish 5432:5432 --volume /srv/docker/postgresql:/var/lib/postgresql xenron/postgresql
```

log in server
```bash
docker exec -it postgresql sudo -u postgres psql
```

