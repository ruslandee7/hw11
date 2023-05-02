FROM ubuntu:18.04
RUN apt update
RUN apt install openjdk-8-jre git maven \
 openssh-client -y
# Configure ssh client
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa
# Install docker 18.03
RUN apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common -н
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update
RUN apt-get -y install docker-ce=18.03.1~ce-0~debian



