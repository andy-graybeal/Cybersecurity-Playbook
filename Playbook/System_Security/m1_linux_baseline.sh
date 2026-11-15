#!/bin/bash

# Create the role groups.
sudo groupadd m1readers
sudo groupadd m1operators

# Create the reader and assign its role group.
sudo useradd -m -G m1readers m1reader

# Create the operator and assign both role groups.
sudo useradd -m -G m1readers,m1operators m1operator

# Create the retired test account.
sudo useradd -m m1retired

# Create the Published and Working directories.
sudo mkdir -p /srv/courselab/published /srv/courselab/working

# Create a sample published file.
echo "Team notice" | sudo tee /srv/courselab/published/notice.txt

# Set Published ownership and permissions.
sudo chown -R root:m1readers /srv/courselab/published
sudo chmod 2750 /srv/courselab/published
sudo chmod 640 /srv/courselab/published/notice.txt

# Set Working ownership and permissions.
sudo chown root:m1operators /srv/courselab/working
sudo chmod 2770 /srv/courselab/working

# Lock and expire the retired account and prevent shell login.
sudo usermod -L -e 1 -s /sbin/nologin m1retired