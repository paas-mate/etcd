FROM ttbb/base

ENV ETCD_HOME /opt/sh/etcd

ARG TARGETARCH

RUN wget https://storage.googleapis.com/etcd/v3.5.4/etcd-v3.5.4-linux-$TARGETARCH.tar.gz  && \
mkdir -p etcd && \
tar -xf etcd-v3.5.4-linux-$TARGETARCH.tar.gz -C etcd --strip-components 1 && \
rm -rf etcd-v3.5.4-linux-$TARGETARCH.tar.gz && \
ln -s /opt/sh/etcd/etcd /usr/bin/etcd && \
ln -s /opt/sh/etcd/etcdctl /usr/bin/etcdctl

WORKDIR /opt/sh/etcd
