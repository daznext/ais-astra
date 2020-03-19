#!/bin/bash

docker build . -t "ais-docker"
docker tag ais-docker:latest vitacore/ais-docker:latest
docker push vitacore/ais-docker:latest
