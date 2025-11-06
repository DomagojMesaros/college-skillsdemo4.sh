#!/bin/bash

set -euo pipefail



screenshot() {
  echo "_____________________________________________________________________________________"
  echo "Screenshot now. Press ENTER to continue after it has been taken..."
  echo "_____________________________________________________________________________________"
  read
  
}

echo "Installing tree package"
sudo apt install tree -y

echo "Checking to see if /home/admin already exists."

if [ -d "/home/admin" ]; then
    echo "The folder already exists. This script will delete the contents of the folder and create new ones."
    read -p "Would you like to continue: Y/N?" choice
  if [ $choice == "y" ] || [ $choice == "Y" ]; then
      sudo rm -r /home/admin
  else 
      exit
  fi
else
    echo "Folder doesn't exist. It will be created now."
fi

sudo mkdir /home/admin
echo "sudo mkdir /home/admin"
screenshot
sudo mkdir /home/admin/office
echo "sudo mkdir /home/admin/office"
screenshot
sudo mkdir /home/admin/accounts
echo "sudo mkdir /home/admin/accounts"
screenshot
sudo mkdir /home/admin/office/pending
echo "sudo mkdir /home/admin/office/pending"
screenshot


echo "Folders admin, office, accouns, and pending created"

cd /home/admin
echo "Calling tree command"
tree
screenshot


echo "Allowing sudoers access to /home/admin recursively"


sudo chgrp -R sudo /home/admin
echo "sudo chgrp -R sudo /home/admin"
screenshot
sudo chmod -R 775 /home/admin
echo "sudo chmod -R 775 /home/admin"
screenshot

echo "Admin Privileges applied"

sudo setfacl -m g:office:rwx /home/admin/office
echo "sudo setfacl -m g:office:rwx /home/admin/office"
screenshot
sudo setfacl -m g:accounts:rwx /home/admin/accounts
echo "sudo setfacl -m g:accounts:rwx /home/admin/accounts"
screenshot
sudo setfacl -m g:office:--- /home/admin/accounts
echo "sudo setfacl -m g:office:--- /home/admin/accounts"
screenshot
sudo setfacl -m g:accounts:--- /home/admin/office
echo "sudo setfacl -m g:accounts:--- /home/admin/office"
screenshot
sudo setfacl -m u:dave:rwx /home/admin/office/pending
echo "sudo setfacl -m u:dave:rwx /home/admin/office/pending"
screenshot
sudo setfacl -m u:frank:rx /home/admin/office/pending
echo "sudo setfacl -m u:dave:rwx /home/admin/office/pending"
screenshot


echo "Script finished"

