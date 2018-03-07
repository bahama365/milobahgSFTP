#!/bin/bash

#Create user acounts and passwords

#Create user account
read -p "Enter the friendly name of the user account (Only for comments, not used in username): " accusername

#Create username
echo Creating a random username for $accusername:
               uname=sft$(tr -dc a-z2-9 < /dev/urandom | head -c 4 | xargs)

       if ! id $uname > /dev/null 2>&1; then
               echo Checking to see if username already exists....ok to create user!!      
       fi


#Create password for new user, using pwgen
#echo Creating a random password for $accusername
               pass=$(pwgen -N1 -B) 
#
#
#
read -p "Create account for $accusername? (y/n)?"
	if [ $REPLY != "y" ]; then
		echo "Exiting..."
		exit 1
	fi

#Expiration date
#read -p "Enter account expiration date (YYYY-MM-DD):" expiration

#Adding user
mkdir -p /home/$uname
useradd -g sftponly -c "$accusername" -k /etc/skel_sftp/ -b /home/$uname -m $uname

echo $uname:$pass | chpasswd 
echo Creating account....done!!
echo
#Logging new user created
date=$(date)
echo SFTP Account: $uname for user: $accusername created on $date >> /var/sftp_log/accountlog.log 


cat << EOF
**************************************
*                                    *
 Username:    $uname
              
 Password:    $pass

 Expiration:  Account never expires!
*                                    *
**************************************
EOF
echo

#echo $accusername
#echo $uname
#echo $pass

 
#
#


