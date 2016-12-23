# Docker Pandas
docker build -t xenron/python:da-pandas -f da-pandas.Dockerfile .
docker run -itd --name python-da-pandas -h python-da-pandas xenron/python:da-pandas bash
docker exec -it python-da-pandas bash

# NLP Japanese
# mecab, cabocha, etc...
docker build -t xenron/python:da-nlp-jpn -f da-nlp-japanese.Dockerfile .
docker run -itd --name python-da-nlp-jpn -h python-da-nlp-jpn xenron/python:da-nlp-jpn bash
docker exec -it python-da-nlp-jpn bash

