#!/bin/bash
# Installs the public key supplied by Terraform, then runs sshd in the foreground.
set -e
mkdir -p /home/ansible/.ssh
echo "${SSH_PUBLIC_KEY}" > /home/ansible/.ssh/authorized_keys
chown -R ansible:ansible /home/ansible/.ssh
chmod 700 /home/ansible/.ssh
chmod 600 /home/ansible/.ssh/authorized_keys
exec /usr/sbin/sshd -D -e
