#!/bin/bash
# From https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#latest-releases-via-apt-ubuntu
apt-get update &&\
apt-get install software-properties-common &&\
apt-add-repository --yes --update ppa:ansible/ansible &&\
apt-get install ansible
