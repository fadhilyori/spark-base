FROM alpine:3.11

LABEL author="Fadhil Yori Hibatullah"

ENV SPARK_VERSION=2.4.5
ENV HADOOP_VERSION=2.7

RUN apk add --no-cache bash openjdk8-jre tar gzip wget && \
    wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark && \
    rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    apk del tar gzip wget

# Set Environment Variable
ENV PATH="$PATH:/spark/bin:/spark/sbin"
ENV JAVA_HOME=/usr/lib/jvm/default-jvm/jre
ENV SPARK_HOME=/spark