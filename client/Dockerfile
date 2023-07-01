FROM centos:centos7

MAINTAINER Sergei Tarasov <sp.tarasov@gmail.com>
#installing ssh client and remove standart repo
RUN yum install -y openssh-clients  && rm /etc/yum.repos.d/*repo
#copy the ssh .pub key
COPY --chmod=600 ./authorized_keys /root/.ssh/authorized_keys
#copy local.repo config file
COPY ./local.repo /etc/yum.repos.d/local.repo
