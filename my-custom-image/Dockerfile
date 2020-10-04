FROM oracle/database:11.2.0.2-xe

ENV ORACLE_BASE=/u01/app/oracle 
ENV ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
ENV ORACLE_SID=XE
ENV ORACLE_PWD=admin
ENV RUN_FILE="runOracle.sh" 
ENV PATH=$ORACLE_HOME/bin:$PATH
ENV ORACLE_ALLOW_REMOTE=true

COPY image-data /db-install-scripts 
COPY db-creation/db-schema db-creation/db-data /db-install-scripts/db-creation/

RUN find /db-install-scripts -name "*.sh" -exec chmod +x {} \; \
    && /db-install-scripts/$RUN_FILE \ 
    && /db-install-scripts/create-my-schema.sh
