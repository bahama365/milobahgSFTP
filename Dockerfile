FROM centos:latest
LABEL maintainer=milobahg
RUN yum update -y; yum install epel-release -y; \
  yum update -y; yum install pwgen-2.07-1.el7.x86_64 vim -y; \
  groupadd sftponly; mkdir -p /var/sftp_log; \
  chmod u+x /usr/local/bin* ; yum install openssh-server -y
RUN  echo -e  'y\n'|ssh-keygen -q -t rsa -N "" -f /etc/ssh/ssh_host_rsa_key
RUN echo "root:ChangeMeNow" | chpasswd
ADD scripts/ /usr/local/bin
ADD sshd_config /etc/ssh/sshd_config
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
