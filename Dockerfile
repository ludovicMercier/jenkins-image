FROM jenkins/jenkins:2.138.2

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

ADD groovy /usr/share/jenkins/ref/init.groovy.d

COPY plugins/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

ENV JENKINS_OPTS="--webroot=/var/cache/jenkins/war"
USER root
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins

USER jenkins