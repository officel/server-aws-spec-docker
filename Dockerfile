FROM ruby:alpine

ENV SERVERSPEC_VERSION 2.41.3
ENV AWSPEC_VERSION 1.4.2

RUN gem install serverspec -v ${SERVERSPEC_VERSION} -N \
 && gem install awspec     -v ${AWSPEC_VERSION} -N

WORKDIR /work

ENTRYPOINT ["/usr/local/bin/rake"]
CMD ["--tasks"]

