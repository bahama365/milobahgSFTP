# Docker SFTP server with chroot'd users.

Edit the Dockerfile with the root password of your choice, otherwise use the default password of 'ChangeMeNow' and then change at login. Only root used is allowed TTY access, once you are logged in run 'sftpsystem' to create a new SFTP user account. SFTP users can only use SFTP, not TTY. Two volumes created (optional) at tun time, inspect to see where the data is help locally on host.

If you are cloning from here, then you will need to make all scripts inside of the scripts/ dir executable first (cd into scripts and then chmod u+x *)

docker run --name sftp -v sftpdata:/home -v sftplogs:/var/sftp_log -p 2222:22 -d milobahg/sftp:latest
