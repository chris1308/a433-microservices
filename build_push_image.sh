#!/bin/bash

# variabel yang dibutuhkan 
DOCKERHUB_USERNAME="chris1308"
IMAGE_NAME="item-app"
TAG="v1"
DOCKERHUB_IMAGE="$DOCKERHUB_USERNAME/$IMAGE_NAME:$TAG"

# 1. Build Docker image dengan nama item-app dan tag v1
# echo untuk menampilkan pesan status proses ke terminal, . sebagai penanda lokasi dockerfile
echo "Building Docker image..."
docker build -t item-app:v1 .

# 2. Melihat daftar image di lokal
echo "Viewing local Docker images..."
docker images

# 3. Mengubah nama image agar sesuai dengan format Docker Hub
echo "Renaming Docker image to $DOCKERHUB_IMAGE..."
docker tag $IMAGE_NAME:$TAG $DOCKERHUB_IMAGE

# 4. Login ke Docker Hub
echo "Logging in to Docker Hub..."
docker login --username=$DOCKERHUB_USERNAME

# 5. Mengunggah image ke Docker Hub
echo "Pushing Docker image to Docker Hub..."
docker push $DOCKERHUB_IMAGE