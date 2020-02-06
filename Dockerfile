FROM opensuse/leap:15

LABEL author="Fadhil Yori Hibatullah"

ENV SPARK_VERSION=2.4.4
ENV HADOOP_VERSION=2.7
ENV SCALA_VERSION=2.13.1

RUN zypper in -y net-tools-deprecated bash java-1_8_0-openjdk tar gzip wget && \
    wget https://downloads.lightbend.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz && \
    tar -xvzf scala-${SCALA_VERSION}.tgz && mv scala-${SCALA_VERSION} scala && rm scala-${SCALA_VERSION}.tgz && \
    wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    zypper rm --clean-deps -y tar gzip wget && \
    zypper clean -a

# Set Environment Variable
ENV PATH="$PATH:/scala/bin:/spark/bin:/spark/sbin"
ENV JAVA_HOME=/usr/lib64/jvm/jre-1.8.0-openjdk
ENV SPARK_HOME=/spark