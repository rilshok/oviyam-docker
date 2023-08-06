FROM tomcat:7.0.91-jre7

RUN apt-get install curl unzip

WORKDIR  /ovitmp
RUN curl http://netix.dl.sourceforge.net/project/dcm4che/Oviyam/2.8.2/Oviyam-2.8.2-bin.zip > oviyam.zip
RUN unzip oviyam.zip

RUN rm -R /usr/local/tomcat/webapps/ROOT/
RUN cp Oviyam-2.8.2-bin/Oviyam-2.8.2-bin/oviyam2.war /usr/local/tomcat/webapps/ROOT.war
RUN cp Oviyam-2.8.2-bin/tomcat/*.jar  /usr/local/tomcat/lib
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
