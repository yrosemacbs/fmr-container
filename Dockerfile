ARG BASE_REGISTRY="docker.io/library"
ARG FMR_VERSION="11.19.0"
ARG TOMCAT_IMAGE="tomcat:9.0.97-jdk21-corretto-al2"

FROM ${BASE_REGISTRY}/${TOMCAT_IMAGE}

RUN echo 'export JAVA_OPTS="-Xmx4G"' >> $CATALINA_HOME/bin/setenv.sh

RUN curl -LO --output-dir $CATALINA_HOME/webapps --variable '%FMR_VERSION' --expand-url "https://github.com/bis-medit-sdmxio/fmr/releases/download/v{{FMR_VERSION}}/fmr-{{FMR_VERSION}}.war"
