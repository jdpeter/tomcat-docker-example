#using bas as centos
FROM centos:6.6

MAINTAINER Joel Peter <joel.daniel.peter@gmail.com>

#create group dev and user tom
RUN groupadd dev
RUN useradd -G dev -d /home/tom -m -s /bin/bash tom

RUN useradd -G dev -d /home/tom -m -s /bin/bash tom

#install wget and unzip
RUN yum -y install wget
RUN yum -y install unzip

#change current directory to /home/tom
WORKDIR /home/tom
RUN wget http://atgensoft.com/html/downloads/Docker_tomcat.zip
RUN unzip Docker_tomcat.zip

#installing jre on the machine
RUN rpm -ivh TOMCAT/jre-8u45-linux-x64.rpm

#set environment variables
ENV JAVA_HOME /usr/java/jre1.8.0_45/
ENV CATALINA_HOME /home/tom/TOMCAT/apache-tomcat-6.0.44

#give permission to use tom to execute
RUN chmod -R 755 /home/tom && chown -R tom /home/tom

#expose the port 8080 so that tomcat can be accessed outside the container
EXPOSE 8080

#change the user to tom
USER tom

#setting the default commad to be executed to run tomcat.
CMD sh $CATALINA_HOME/bin/catalina.sh run