# Suricata DevOps pipeline scripts
This repository contains scripts used in the suricata DevOps AWS pipeline. Primarily the Dockerfiles used for the docker images used to run tests, build and package the code in CodeBuild projects

## Build images
To build the images, run:

```bash
cd docker
docker image build -t suricata-coccinelle -f Dockerfile-coccinelle-ubuntu .
docker image build -t suricata-devops:centos8 -f Dockerfile-devops-centos8 .
```

After building, push them to a Docker registry, like ECR or Docker Hub
