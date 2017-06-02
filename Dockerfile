FROM centos:7

RUN yum install -y gcc gcc-c++ \
                   libtool libtool-ltdl \
                   make cmake \
                   git \
                   pkgconfig \
                   sudo \
                   automake autoconf \
                   yum-utils rpm-build && \
    yum clean all

# Install source RPM
ADD http://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/o/open-vm-tools-10.1.5-4.fc27.src.rpm /root/open-vm-tools-10.1.5-4.fc27.src.rpm
RUN rpm -ivh /root/open-vm-tools-10.1.5-4.fc27.src.rpm

# Install deps
RUN yum-builddep -y /root/rpmbuild/SPECS/open-vm-tools.spec

# Copy sources
ADD https://github.com/vmware/open-vm-tools/archive/stable-10.1.5.tar.gz /root/rpmbuild/SOURCES

ENV FLAVOR=rpmbuild OS=centos DIST=el7
