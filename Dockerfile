FROM ubuntu:latest
MAINTAINER Theeraphol Wattanavekin <parnurzeal@gmail.com>
RUN apt-get update
RUN apt-get install -y g++ make curl python
RUN curl -SL http://www.openfst.org/twiki/pub/FST/FstDownload/openfst-1.4.1.tar.gz \
    | tar -xzC /root/
WORKDIR /root/openfst-1.4.1
RUN ./configure --enable-far=true --enable-pdt=true
RUN make && make install
RUN curl -SL http://www.openfst.org/twiki/pub/GRM/ThraxDownload/thrax-1.1.0.tar.gz \
    | tar -xzC /root/
WORKDIR /root/thrax-1.1.0
RUN ./configure
RUN make && make install
ENV LD_LIBRARY_PATH /usr/local/lib
