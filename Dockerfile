FROM ubuntu:latest

RUN apt-get update \
  && apt-get install -y software-properties-common python-software-properties \
  && apt-add-repository ppa:bitcoin/bitcoin \
  && apt-get update \
  && apt-get install -qq -y bitcoind \
  && mkdir -p /root/.bitcoin/ \
  && rm -rf /var/lib/apt/lists/*

EXPOSE 8333
EXPOSE 8332

WORKDIR /bitcoin
COPY bitcoin.conf /bitcoin/bitcoin.conf
ENTRYPOINT ["/usr/bin/bitcoind"]
