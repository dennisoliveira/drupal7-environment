#!/bin/bash

echo "Gerando ambiente drupal 7...\n"

# Obter arquivos de configuração do docker
wget https://raw.githubusercontent.com/dennisoliveira/drupal7-environment/master/.env
wget https://raw.githubusercontent.com/dennisoliveira/drupal7-environment/master/Dockerfile
wget https://raw.githubusercontent.com/dennisoliveira/drupal7-environment/master/docker-compose.yml

# Gerar pasta e arquivos de configuração
mkdir config
wget https://raw.githubusercontent.com/dennisoliveira/drupal7-environment/master/config/000-default.conf -P config
wget https://raw.githubusercontent.com/dennisoliveira/drupal7-environment/master/config/mycustom.cnf -P config

# Gerar pastas e arquivos da aplicação
mkdir www
wget https://ftp.drupal.org/files/projects/drupal-7.59.tar.gz -P www
tar -xzvf ./www/drupal-7.59.tar.gz -C ./www
rm ./www/drupal-7.59.tar.gz

wget https://raw.githubusercontent.com/dennisoliveira/drupal7-environment/master/config/settings.php -P www/drupal-7.59/sites/default

chmod a+w www/drupal-7.59/sites/default && \
chmod a+w www/drupal-7.59/sites/default/settings.php

# Levantar ambiente
docker-compose up -d

echo "Ambiente drupal 7 finalizado.\n"


