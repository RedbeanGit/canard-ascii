#!/usr/bin/env sh

ansible-playbook --ssh-extra-args="-o IdentitiesOnly=yes" main.yaml