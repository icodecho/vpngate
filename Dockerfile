FROM centos:6.6
RUN yum install -y make gcc gcc-g++ which wget tar epel-release expect asciidoc curl openssh-server sudo
RUN yum update -y 
#RUN yum install -y tinyproxy
#RUN yum install -y squid
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
RUN echo "root:thisismyvpn" | chpasswd
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key  
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN mkdir /var/run/sshd 
ADD ./bin /usr/local/sbin
ADD ./opt /opt
RUN chmod +x /usr/local/sbin/run
EXPOSE 22/tcp 443/tcp 1194/tcp
#EXPOSE 22/tcp 443/tcp 80/tcp 1194/tcp
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENTRYPOINT ["/usr/local/sbin/run"]
