#!/bin/bash

#Check an accounts expiration
read -p "Enter the username you wish to check: " accuname

getent passwd $accuname > /dev/null 2&>1

if [ $? -eq 0 ]; then
    echo "Username exists, continuing...."
else
    echo "Username does not exist, returning to main menu...."
    exit 1

fi

echo Checking account....
chage -l $accuname | grep Account
