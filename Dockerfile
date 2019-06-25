FROM solr:8.0.0

COPY ikanalyzer-solr5/*.jar /opt/solr-${SOLR_VERSION}/server/solr-webapp/webapp/WEB-INF/lib/
USER root
RUN mkdir -p /opt/solr-${SOLR_VERSION}/server/solr-webapp/webapp/WEB-INF/classes
COPY ikanalyzer-solr5/*.dic  ikanalyzer-solr5/*.xml /opt/solr-${SOLR_VERSION}/server/solr-webapp/webapp/WEB-INF/classes/
COPY mycore /opt/solr-${SOLR_VERSION}/server/mycore
COPY custom.sh /docker-entrypoint-initdb.d/
USER solr
VOLUME [ "/var/solr/data" ]
EXPOSE 8983

ENV TZ Asia/Shanghai
ENV CORE_NAME mycore
ENV SOLR_GROUP solr
ENV LANG C.UTF-8
ENV SOLR_USER solr
ENV JAVA_HOME /usr/local/openjdk-11
ENV JAVA_VERSION 11.0.3
ENV HOME /opt/solr-8.0.0
ENV SOLR_VERSION 8.0.0
ENV SOLR_HOME /var/solr/data
ENV SOLR_LOGS_DIR /var/solr/logs