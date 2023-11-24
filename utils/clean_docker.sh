docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker system prune -a -f --volumes
docker volume prune --force
docker network prune --force
docker image prune --all --force
