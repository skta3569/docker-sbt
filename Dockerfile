FROM ubuntu:20.04

# Graalとsbtを配置してパスを通す
ADD graalvm-ce-java8-linux-amd64-20.3.1.2.tar.gz /usr/local/
ADD sbt-1.3.13.tgz /usr/local/

ENV PATH=/usr/local/sbt/bin:/usr/local/graalvm-ce-java8-20.3.1.2/bin:$PATH

# sbt系のキャッシュをvolumeに配置
RUN mkdir -p /sbt_cache/.cache \
    && mkdir /sbt_cache/.ivy2 \
    && mkdir /sbt_cache/.sbt \
    && ln -s /sbt_cache/.cache ~/.cache \
    && ln -s /sbt_cache/.ivy2 ~/.ivy2 \
    && ln -s /sbt_cache/.sbt ~/.sbt 

VOLUME /sbt_cache

# docker run する際にはこのディレクトリにローカルの対象ディレクトリをマウントして使う
WORKDIR /work

ENTRYPOINT ["sbt"]
