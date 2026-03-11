#!/bin/bash

[ -f /etc/apt/sources.list.d/docker.sources ] && { echo "Docker repository need to be installed"; exit 1 }

sudo apt update -y && apt install -y \
  containerd.io \
  docker-ce \
  docker-ce-cli \
  docker-buildx-plugin \
  docker-compose-plugin