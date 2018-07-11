# 
# arednmesh/httpdmd
#

FROM httpd
MAINTAINER dman776@gmail.com
ENV IMAGE=arednmesh/httpdmd

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libtool \
    automake \
    autoconf \
    libmarkdown2-dev \
    apache2-dev

WORKDIR /opt/aredn
RUN git clone https://github.com/hamano/apache-mod-markdown
WORKDIR /opt/aredn/apache-mod-markdown
RUN autoreconf -f -i
RUN ./configure --with-apxs=/usr/local/apache2/bin/apxs --with-discount=/usr
RUN make
RUN make install


