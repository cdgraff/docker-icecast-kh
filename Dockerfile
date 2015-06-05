#
# Icecast-hk Dockerfile
# version 2.4.0 
#
# Build:
# docker build -t zokeber/icecast-kh:latest .
#
# Create:
# docker create -it --name container-icecast-kh -h icecast-kh zokeber/icecast-kh
#
# Start:
# docker start container-icecast-kh
#
# Connect with bash
# docker exec -it container-icecast-kh bash


# Pull base image
FROM zokeber/centos

# Maintener
MAINTAINER Daniel Lopez Monagas <zokeber@gmail.com>

# Update OS
RUN yum update -y

# Install packages neccesary to compiled Icecast with support aac+
RUN yum install -y git curl libcurl libcurl-devel libtheora libtheora-devel speex speex-devel libxml2 libxml2-devel libxslt libxslt-devel libogg libogg-devel libvorbis libvorbis-devel

# Install development tools
RUN yum groupinstall -y "Development tools"

# Download icecast-kh
RUN wget --directory-prefix=/root/ -c https://github.com/karlheyes/icecast-kh/archive/icecast-2.4.0-kh1.tar.gz

# Unpackage and Compile icecast-kh
RUN cd /root/ && tar xzf icecast-2.4.0-kh1.tar.gz && cd icecast-kh-icecast-2.4.0-kh1 && ./configure --prefix=/usr && make && make install

# Clean cache and remove directory
RUN yum clean all && rm -fr /root/icecast-kh-icecast-2.4.0-kh1 && rm /root/icecast-2.4.0-kh1.tar.gz

# Set the environment variables
ENV HOME /root

# Working directory
WORKDIR /root

# Default command
CMD ["bash"]
