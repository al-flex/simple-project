#This is the base image we use to create our image from.
FROM jenkins

USER root

RUN apt-get update && apt-get install -y curl php-cli php-mbstring unzip php-dom --no-install-recommends apt-utils
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php && php composer-setup.php --install-dir=/usr/local/bin --filename=composer


#Information about creator
MAINTAINER Alexander (email)

#Remove admin password setup
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

#Create admin user
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy

#Automatically installing all plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

