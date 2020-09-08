#! /bin/bash
# sudo apt-get update
# sudo apt-get upgrade -y
# sudo apt install -y docker.io
# docker --version
# sudo docker pull puckel/docker-airflow
# sudo docker run -d -p 8080:8080 -v /tmp/initial_dag.py:/usr/local/airflow/dags puckel/docker-airflow webserver

sudo apt-get update
sudo apt-get upgrade -y
sudo apt install -y docker.io
sudo apt install -y curl
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker --version
docker-compose --version
cd /tmp/
sudo docker-compose build
sudo docker-compose up -d