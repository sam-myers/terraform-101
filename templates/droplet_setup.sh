#!/usr/bin/env bash

function wait_for_apt_get {
    while fuser /var/{lib/{dpkg,apt/lists},cache/apt/archives}/lock >/dev/null 2>&1; do
       sleep 1
    done
}

function apt_get_update {
    sleep 10
    while ! apt-get -y update; do sleep 1; done
}

function apt_get_install {
    while ! apt-get -y install $1; do sleep 5; done
}

function install_do_agent {
    curl -sSL https://agent.digitalocean.com/install.sh | sh
}

function install_docker {
    apt_get_install apt-transport-https
    apt_get_install curl
    apt_get_install software-properties-common

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"

    apt_get_install docker-ce
}

wait_for_apt_get
apt_get_update
apt_get_install unzip
install_do_agent
install_docker
