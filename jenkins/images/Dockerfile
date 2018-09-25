FROM jenkins/jenkins:2.138.1
MAINTAINER tangtao 307025795@qq.com
#切换为root用户
USER root
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime
ENV TZ Asia/Shanghai
#更新当前的shell环境
SHELL ["/bin/bash", "-c"]
#安装node、npm、yarn环境
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash && \
    apt-get install -y nodejs && \
    openjdk-7-jdk && \
    apt-get install -y build-essential && \
    rm -rf /var/lib/apt/lists/* && \
    npm install -g yarn
    #curl -O https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz && \
    #tar zxvf docker-latest.tgz && \
    #cp docker/docker /usr/local/bin/ && \
    #rm -rf docker docker-latest.tgz
# 将 `jenkins` 用户的组 ID 改为宿主 `docker` 组的组ID，从而具有执行 `docker` 命令的权限。
#ARG DOCKER_GID=999 
ARG DOCKER_PORT=9090
USER $USER

EXPOSE ${DOCKER_PORT}