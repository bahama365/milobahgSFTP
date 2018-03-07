#!/bin/bash
#
#########################################
# Check when a SFTP user last logged in #
#########################################
#
#
# // First check to see which users are not system (less than 1000 UID)
usrFile=$(awk -F: '{if ($3 >= 1000) print $1}' < /etc/passwd)
secureFile=$(awk '{if ($8 == opened) print $11}' < /var/log/secure)
IFS=$'\n'
#
for name in secureFile
do echo $name
done

