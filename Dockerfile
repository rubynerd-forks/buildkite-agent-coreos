FROM buildkite/agent:ubuntu

ENV cachebust 20180216

# Install docker client version 1.6.2

ENV DEBIAN_FRONTEND="noninteractive"
#RUN echo deb http://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list
#RUN apt-get install -qqy apt-transport-https && apt-get update -qq && apt-get install -qqy apt-transport-https ca-certificates curl software-properties-common
#RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
#RUN apt-key fingerprint 0EBFCD88
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
RUN echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list
RUN apt-get install -qqy apt-transport-https
RUN apt-get update -qq && apt-get install -qqy \
    lxc-docker-1.6.2

ADD ./buildkite/bootstrap.sh ./buildkite/bootstrap.sh

ENTRYPOINT ["buildkite-agent"]
CMD ["start"]
