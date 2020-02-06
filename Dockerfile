FROM opensuse/leap:15

LABEL author="Fadhil Yori Hibatullah"

ENV SPARK_VERSION=2.3.4
ENV HADOOP_VERSION=2.7

RUN zypper in -y net-tools-deprecated bash java-1_8_0-openjdk tar gzip wget && \
    wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    zypper rm --clean-deps -y tar gzip wget && \
    zypper clean -a

# Set Environment Variable
ENV PATH="$PATH:/spark/bin:/spark/sbin"
ENV JAVA_HOME=/usr/lib64/jvm/jre-1.8.0-openjdk
ENV SPARK_HOME=/spark