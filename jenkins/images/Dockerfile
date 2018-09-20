FROM jenkins:2.60.3

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime
ENV TZ Asia/Shanghai

USER root
ARG dockerGid=978

RUN rm /etc/apt/sources.list
COPY sources.list /etc/apt/sources.list

RUN apt-get update && apt-get install -y --no-install-recommends \
	libltdl7 \
	&& rm -rf /var/lib/apt/lists/*
	
#ENV NODE_VERSION 8

#add jenkins to docker group and install nodejs/npm

RUN echo "docker:x:${dockerGid}:jenkins" >> /etc/group \
    && cd /home \
    #&& curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash  \
    && apt-get install -y nodejs  \
    && apt-get install -y build-essential  \
    && npm install -g yarn

#RUN npm install -g cnpm --registry=https://registry.npm.taobao.org
#RUN ln -s /home/node-v$NODE_VERSION/bin/cnpm /usr/local/bin/cnpm

USER jenkins