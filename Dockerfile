FROM solr:8.0.0
ENV TZ Asia/Shanghai
ENV CORE_NAME mycore
COPY ikanalyzer-solr5/*.jar /opt/solr-${SOLR_VERSION}/server/solr-webapp/webapp/WEB-INF/lib/
USER root
RUN mkdir -p /opt/solr-${SOLR_VERSION}/server/solr-webapp/webapp/WEB-INF/classes
COPY ikanalyzer-solr5/*.dic  ikanalyzer-solr5/*.xml /opt/solr-${SOLR_VERSION}/server/solr-webapp/webapp/WEB-INF/classes/
#COPY docker-entrypoint.sh /opt/docker-solr/scripts/docker-entrypoint.sh
COPY mycore /opt/solr-${SOLR_VERSION}/server/mycore
COPY custom.sh /docker-entrypoint-initdb.d/
USER solr
VOLUME [ "/var/solr/data" ]