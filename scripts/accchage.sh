#!/bin/bash

#Change a password expiration
read -p "Enter the username for the account you wish to change: " accuname

getent passwd $accuname > /dev/null 2&>1

if [ $? -eq 0 ]; then
    echo "Username exists, continuing...."
else
    echo "Username does not exist, returning to main menu...."
    exit 1
    
fi

read -p "Enter the new expiration date that you wish to set YYYY-MM-DD: " expiration
chage -E $expiration $accuname
echo Expiration date successfully changed to $expiration for username $accuname
