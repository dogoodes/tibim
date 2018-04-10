FROM h1kkan/jenkins-docker:lts
MAINTAINER dogood.es <devgood@dogood.es>

USER root

RUN usermod -aG docker jenkins

EXPOSE 8080 50000

VOLUME ["/var/jenkins_home"]

USER jenkins