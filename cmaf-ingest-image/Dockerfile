FROM ubuntu:18.04

RUN apt-get update && apt-get -y upgrade && apt-get -y install wget

RUN apt-get -y --no-install-recommends install \
  aptitude \
  bash-completion \
  build-essential \
  cmake \
  coreutils \
  gcc \
  g++ \
  gdb \
  git-core \
  ncdu \
  unzip \
  vim \
  libcurl4-openssl-dev

RUN cd /home && git clone https://github.com/unifiedstreaming/fmp4-ingest.git && cd fmp4-ingest/ingest-tools && cmake CMakeLists.txt && make

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

COPY tos-096-750k.cmfv /home/fmp4-ingest/ingest-tools/tos-096-750k.cmfv

COPY tos-096s-128k.cmfa /home/fmp4-ingest/ingest-tools/tos-096s-128k.cmfa

COPY tos-de-096s.cmft /home/fmp4-ingest/ingest-tools/tos-de-096s.cmft

COPY tos-en-096s.cmft /home/fmp4-ingest/ingest-tools/tos-en-096s.cmft

COPY tos-es-096s.cmft /home/fmp4-ingest/ingest-tools/tos-es-096s.cmft

COPY tos-fr-096s.cmft /home/fmp4-ingest/ingest-tools/tos-fr-096s.cmft

RUN chmod +x /usr/local/bin/entrypoint.sh 

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"] 

CMD cd /home/fmp4-ingest/ingest-tools && pwd && ./fmp4ingest $CMD_ARGS -u $PUB_POINT_URI $CMAF_FILES
