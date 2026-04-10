# Gatling is a highly capable load testing tool.
#
# Documentation: https://gatling.io/docs/3.9/
# Cheat sheet: https://gatling.io/docs/3.9/cheat-sheet/
FROM eclipse-temurin:17.0.18_8-jdk-noble
LABEL org.opencontainers.image.authors=GerritForge
# working directory for gatling
WORKDIR /opt
# gating version
ENV GATLING_VERSION 3.9.5
# create directory for gatling install
RUN mkdir -p gatling
# install gatling
RUN apt-get install -y wget zip && \
  mkdir -p /tmp/downloads && \
  wget -q -O /tmp/downloads/gatling-$GATLING_VERSION.zip \
  https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/$GATLING_VERSION/gatling-charts-highcharts-bundle-$GATLING_VERSION-bundle.zip && \
  mkdir -p /tmp/archive && cd /tmp/archive && \
  unzip /tmp/downloads/gatling-$GATLING_VERSION.zip && \
  mv /tmp/archive/gatling-charts-highcharts-bundle-$GATLING_VERSION/* /opt/gatling/ && \
  rm -rf /tmp/*
# change context to gatling directory
WORKDIR  /opt/gatling
# set directories below to be mountable from host
VOLUME ["/opt/gatling/conf", "/opt/gatling/results", "/opt/gatling/user-files"]
# set environment variables
ENV PATH /opt/gatling/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV GATLING_HOME /opt/gatling
ENTRYPOINT ["gatling.sh"]
