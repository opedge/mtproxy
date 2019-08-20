FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    iproute2 \
    && rm -rf /var/lib/apt/lists/*


RUN git config --global user.email "opedge@gmail.com" && \
    git config --global user.name "Oleg Poyaganov"

RUN cd /opt && \
    git clone https://github.com/TelegramMessenger/MTProxy && \
    cd MTProxy && \
    git fetch origin pull/248/head:deny-wo-padding && \
    git merge deny-wo-padding && \
    make -j8 && \
    cp objs/bin/mtproto-proxy /usr/local/bin/

COPY run.sh /

EXPOSE 8443

CMD ["./run.sh"]