FROM centos:7.4.1708

RUN yum install -y \
    epel-release \
    git \
    kernel-devel \
    rpm-build \
    lsb-redhat-core \
    wget

# Install required repos
COPY container/repos/* /etc/yum.repos.d/

# Install build dependencies
COPY code/tools/packages/rpm/contrail/contrail.spec /tmp/
RUN  yum-builddep -y /tmp/contrail.spec

VOLUME /src
WORKDIR /src
