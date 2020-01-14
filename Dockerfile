FROM  openshift/openjdk-11-rhel7

LABEL maintainer="Adm Web <gadmweb@test.com>" \
      io.openshift.tags="builder,java"
EXPOSE 8080/tcp

EXPOSE 8443/tcp

EXPOSE 8778/tcp
RUN export JAVA_OPTIONS="$JAVA_OPTS -javaagent:/opt/wily/Agent.jar  -Dcom.wily.introscope.agentProfile=/opt/wily/core/config/IntroscopeAgentSpringBoot.profile"
USER 185
WORKDIR /home/jboss

# Instalamos Wily
RUN curl -k -SL https://spacewalk.sis.ad.bia.itau/pub/wily-10.7.0.97.tgz \
    | tar -xzC / 

CMD ["/usr/local/s2i/run"]

