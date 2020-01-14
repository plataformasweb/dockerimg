FROM  openshift/openjdk-11-rhel7

LABEL maintainer="Adm Web <gadmweb@test.com>" \
      io.openshift.tags="builder,java"
EXPOSE 8080/tcp

EXPOSE 8443/tcp

EXPOSE 8778/tcp
USER 185
WORKDIR /home/jboss
ADD run /usr/local/s2i/run
# Instalamos Wily
RUN curl -k -SL https://spacewalk.sis.ad.bia.itau/pub/wily-10.7.0.97.tgz \
    | tar -xzC / 

CMD ["sh /usr/local/s2i/run"]

