FROM shoothzj/base

ENV ETCD_HOME /opt/etcd

ARG TARGETARCH

RUN wget https://storage.googleapis.com/etcd/v3.5.5/etcd-v3.5.5-linux-$TARGETARCH.tar.gz  && \
mkdir -p etcd && \
tar -xf etcd-v3.5.5-linux-$TARGETARCH.tar.gz -C etcd --strip-components 1 && \
rm -rf etcd-v3.5.5-linux-$TARGETARCH.tar.gz && \
ln -s /opt/etcd/etcd /usr/bin/etcd && \
ln -s /opt/etcd/etcdctl /usr/bin/etcdctl && \
ln -s /opt/etcd/etcdutl /usr/bin/etcdutl

WORKDIR /opt/etcd

EXPOSE 2379

ENTRYPOINT [ "/usr/bin/etcd" ]
