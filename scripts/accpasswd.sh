#!/bin/bash

#Change a password

read -p "Enter the account username: " accusername

getent passwd $accusername > /dev/null 2&>1

if [ $? -eq 0 ]; then
    echo "Username exists, continuing...."
else
    echo "Username does not exist, returning to main menu...."
    exit 1
    
fi

read -p "Enter new password for $accusername: " password
echo $accusername:$password | chpasswd
echo Password for $accusername changed successfully!
echo ""
