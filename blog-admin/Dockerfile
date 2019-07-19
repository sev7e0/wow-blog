FROM openjdk:8

MAINTAINER sev7e0 <sev7e0@gmail.com>

ADD ./target/blog-admin.jar /opt/app/admin.jar

RUN ln -s /opt/app/admin.jar /etc/admin.jar

RUN mkdir /logs/

ENV JAVA_OPTS=""

EXPOSE 8099

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS  -jar /etc/admin.jar" ]
