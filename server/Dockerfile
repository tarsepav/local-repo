FROM centos:centos7

MAINTAINER Sergei Tarasov <sp.tarasov@gmail.com>
#installing required packages
RUN yum install -y epel-release 
RUN yum install -y openssh-server openssh-clients createrepo nginx
RUN systemctl enable nginx
#copy the ssh .pub key
COPY --chmod=600 ./authorized_keys /root/.ssh/authorized_keys
#create-repository:
RUN mkdir -p /usr/share/nginx/html/repos/7/os/x86_64
RUN createrepo -v /usr/share/nginx/html/repos/7/os/x86_64
