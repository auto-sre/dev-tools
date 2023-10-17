FROM alpine:3.18
USER root
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
  && apk update \
  && apk add --no-cache busybox-extras postgresql-client mysql-client redis bind-tools bash py-pip ca-certificates curl jq nmap net-tools iperf3 iproute2 perl-net-telnet iputils \
  && pip install s3cmd \
  && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

COPY medusa /usr/bin/medusa
CMD [ "/bin/bash" ]
