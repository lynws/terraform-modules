!/bin/bash -x
# Install Docker
apt-get update -y
apt-get install -y docker.io

# Log in to DockerHub
echo "${dockerhub_token}" | docker login --username ${dockerhub_username} --password-stdin

# Pull and run the Docker image from DockerHub
docker pull ${dockerhub_username}/${image_name}:${tag}
docker run -d -p 80:3000 ${dockerhub_username}/${image_name}:${tag}
