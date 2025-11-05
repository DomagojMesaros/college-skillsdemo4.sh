#!/bin/bash

sudo apt install tree -y


sudo mkdir /home/admin & sudo mkdir /home/admin/office & sudo mkdir /home/admin/accounts & sudo mkdir /home/admin/office/pending

sudo chgrp -R sudo /home/admin
sudo chmod -R 775 /home/admin

sudo setfacl -m g:office:rwx /home/admin/office
sudo setfacl -m g:accounts:rwx /home/admin/accounts
sudo setfacl -m g:office:--- /home/admin/accounts
sudo setfacl -m g:accounts:--- /home/admin/office
sudo setfacl -m u:dave:rwx /home/admin/office/pending
sudo setfacl -m u:frank:rx /home/admin/office/pending

echo "Script finished"

