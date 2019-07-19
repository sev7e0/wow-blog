FROM openjdk:8

MAINTAINER sev7e0 <sev7e0@gmail.com>

ADD ./target/blog-web.jar /opt/app/web.jar

RUN ln -s /opt/app/web.jar /etc/web.jar

RUN mkdir /logs/

ENV JAVA_OPTS=""

EXPOSE 8888

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS  -jar /etc/web.jar" ]
