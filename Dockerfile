FROM alpine:3
LABEL MAINTAINER='Jean-Baptiste PREVOST'

#copy jboss installer and auto.xml auto installer
#COPY jboss-eap-7.0.0-installer.jar /tmp/jboss-eap-7.0.0-installer.jar 
COPY auto.xml /tmp/auto.xml

#expose used ports
EXPOSE 8080 8443 9990

#install openjdk8 and download jboss installer
RUN apk add openjdk8 && \
    wget https://sd-160040.dedibox.fr/hagimont/software/jboss-eap-7.0.0-installer.jar -P /tmp/

#install jboss in no interactive mode
RUN java -jar /tmp/jboss-eap-7.0.0-installer.jar /tmp/auto.xml -variables adminPassword=password#2,vault.keystorepwd=vaultkeystorepw,ssl.password=admin && \
    rm -rf /tmp/jboss-eap-7.0.0-installer.jar /tmp/auto.xml 

#start the jboss server
CMD /bin/bash
#Launch the server which listen on all interfaces
ENTRYPOINT root/EAP-7.0.0/bin/standalone.sh -b 0.0.0.0

