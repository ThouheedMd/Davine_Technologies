#!/bin/bash
# create_users_dirs.sh - Create users and a personal directory for each
# Usage: sudo ./create_users_dirs.sh user1 user2 user3

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root (use sudo)."
    exit 1
fi

if [ $# -eq 0 ]; then
    echo "Usage: sudo $0 username [username...]"
    exit 1
fi

for USERNAME in "$@"; do
    if id "$USERNAME" &>/dev/null; then
        echo "User '$USERNAME' already exists - skipping."
    else
        useradd -m -s /bin/bash "$USERNAME"
        echo "User '$USERNAME' created."
    fi
    mkdir -p "/home/$USERNAME/projects" "/home/$USERNAME/logs"
    chown -R "$USERNAME":"$USERNAME" "/home/$USERNAME/projects" "/home/$USERNAME/logs"
    chmod 750 "/home/$USERNAME/projects" "/home/$USERNAME/logs"
    echo "Directories ready for '$USERNAME'."
done