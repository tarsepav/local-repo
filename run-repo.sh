#!/bin/bash/

echo "build REPO-Server docker image"
docker build -t repo-server /docker/server/
echo "DONE"
echo "run REPO-Server docker container"
docker run -d -it --rm --name repo-server-c -v /docker/repos:/usr/share/nginx/html/repos/7/os/x86_64:Z repo-server /usr/sbin/init
echo "DONE"
echo "determine ip address REPO-Server docker container"
repo_server_ip=`docker inspect repo-server-c | grep IPAddress | grep -m 1 -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}"`
echo "DONE"
echo "build client .repo file"
echo "[local]
name=LocalRepo
baseurl=http://$repo_server_ip/repos/\$releasever/os/\$basearch/
enabled=1
gpgcheck=0" > /docker/client/local.repo
echo "DONE"
echo "build REPO-Client docker image"
docker build -t repo-client /docker/client/
echo "DONE"
echo "run REPO-Client docker container"
docker run -d -it --rm --name repo-client-c repo-client
echo "DONE"