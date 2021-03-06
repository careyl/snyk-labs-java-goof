#!/usr/bin/env bash
if [[ "$1" == "" ]]; then
  read -e -i "${DOCKER_ACCOUNT}" -p "Please enter your DockerHub user/account name: " input
  name="${input:-$DOCKER_ACCOUNT}"
else
  DOCKER_ACCOUNT=$1
fi

echo "📦 Building image ${DOCKER_ACCOUNT}/log4shell-server:latest ..."
docker build -t ${DOCKER_ACCOUNT}/log4shell-server:latest $MYDIR/..
echo
echo "🚚 Pushing image to DockerHub..."
docker push ${DOCKER_ACCOUNT}/log4shell-server:latest
