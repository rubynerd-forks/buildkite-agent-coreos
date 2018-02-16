FROM buildkite/agent:ubuntu

# Install docker client version 1.6.2
ENV DEBIAN_FRONTEND="noninteractive"
RUN echo deb http://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list
RUN apt-get install -qqy apt-transport-https ca-certificates curl software-properties-common; curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN apt-get update -qq && apt-get install -qqy \
    lxc-docker-1.6.2

ADD ./buildkite/bootstrap.sh ./buildkite/bootstrap.sh

ENTRYPOINT ["buildkite-agent"]
CMD ["start"]
