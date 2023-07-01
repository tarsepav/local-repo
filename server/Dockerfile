FROM centos:7
MAINTAINER Sergei Tarasov <sp.tarasov@gmail.com>
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

#installing required packages
RUN yum install -y epel-release 
RUN yum install -y openssh-server openssh-clients createrepo rsyslog nginx; yum clean all; systemctl enable nginx.service && systemctl enable rsyslog
EXPOSE 80
#copy the ssh .pub key
COPY --chmod=600 ./authorized_keys /root/.ssh/authorized_keys
#create-repository:
RUN mkdir -p /usr/share/nginx/html/repos/7/os/x86_64 
RUN createrepo -v /usr/share/nginx/html/repos/7/os/x86_64
RUN ln -sf /proc/1/fd/1 /var/log/nginx/access.log && ln -sf /proc/1/fd/1 /var/log/nginx/error.log && ln -sf /proc/1/fd/1 /var/log/secure
#RUN echo "ping" > /usr/share/nginx/html/ping.html
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -sS localhost/404.html || exit 1
