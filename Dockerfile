FROM postgres:alpine

ARG CSV_DATA=2018-2_CA.csv

COPY ${CSV_DATA} /tmp/
COPY ./scripts/split_data.sh /tmp/

RUN /tmp/split_data.sh "/tmp/${CSV_DATA}"

COPY ./scripts/*.sql /docker-entrypoint-initdb.d/

RUN chmod a+r /docker-entrypoint-initdb.d/*

