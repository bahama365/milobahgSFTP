#!/bin/bash

#Search /etc/passwd for username or name of account holder
echo
read -p "Enter any known details for account name/account owner: " string
grep -i $string /etc/passwd
#echo $searchresult
echo 
