#定义容器名称名称
DOCKER_NAME=jenkins
#定义镜像名称
DOCKER_IMAGES_NAME=registry.cn-hangzhou.aliyuncs.com/zx-docker/${DOCKER_NAME}
#如果当前容器正在运行，干掉
if [ $(docker ps -a | grep -c $DOCKER_NAME) -ge 1 ]; then
    docker rm -f ${DOCKER_NAME};
fi
#如果当前本地镜像列表中有，删掉
if [ $(docker images | grep -c ${DOCKER_IMAGES_NAME}) -ge 1 ]; then
    docker rmi -f ${DOCKER_IMAGES_NAME};
fi
#运行
docker run -itd \
    -p 9090:9090 \
    -p 50000:50000 \
    -e JENKINS_OPTS=--httpPort=9090 \
    -v $(pwd)/jenkins_home:/var/jenkins_home \
    -v $(pwd)/jenkins_home/tools/jdk1.7.0_80:/usr/java/jdk1.7.0_80 \
    --name ${DOCKER_NAME} \
    ${DOCKER_IMAGES_NAME}:latest