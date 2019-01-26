FROM debian:latest

#COPY certs/* /etc/ssl/certs/
COPY certs/SIDIA_M.pem /usr/local/share/ca-certificates/

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get -y install \
        #basic dependencies
        asciidoc bash bc binutils bzip2 fastjar flex git-core gcc g++ \
        util-linux gawk libgtk2.0-dev intltool jikespg zlib1g-dev mercurial\
        make genisoimage libncurses5-dev libssl-dev patch perl-modules \
        python2.7-dev rsync ruby sdcc unzip wget gettext xsltproc zlib1g-dev\
        #others dependencies
        libboost1.62-dev libxml-parser-perl libusb-dev bin86 bcc sharutils \
        openjdk-8-jre \
        #dev base
        build-essential subversion \
        #aditional dependencies for debian 9 stretch
        #libpam-dev libgnutls28-dev libldap-dev libidn2-0-dev libssh2-1-dev \
        #liblzma-dev libsnmp-dev libjansson-dev &&\
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN adduser --disabled-password --uid 1001 --gecos "Docker Builder,,," builder

#RUN update-ca-certificates

USER builder
WORKDIR /home/builder