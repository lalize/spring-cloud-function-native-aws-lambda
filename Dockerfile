ARG ARCH

FROM $ARCH/amazonlinux:2

ARG GRAALVM_ARCH

RUN yum -y groupinstall "Development Tools"
RUN curl -L -O https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-22.3.2/graalvm-ce-java17-linux-${GRAALVM_ARCH}-22.3.2.tar.gz
RUN tar -xzf graalvm-ce-java17-linux-${GRAALVM_ARCH}-22.3.2.tar.gz -C /opt

ENV GRAALVM_HOME="/opt/graalvm-ce-java17-22.3.2"
ENV JAVA_HOME="$GRAALVM_HOME"
ENV PATH="$JAVA_HOME/bin:${PATH}"

WORKDIR /workspace

VOLUME /workspace

CMD ./gradlew clean nativeCompile --no-daemon
