FROM jenkins/jenkins:lts-jdk11
USER root
RUN apt-get update && apt-get install -y make git openjdk-11-jdk
RUN mkdir /srv/backup && chown jenkins:jenkins /srv/backup
USER jenkins
RUN echo lts-jdk11 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
RUN echo lts-jdk11 > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
COPY --chown=jenkins:jenkins config_jenkins /var/jenkins_home
