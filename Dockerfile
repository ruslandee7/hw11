FROM ubuntu:18.04
RUN apt update
RUN apt install openjdk-8-jre git maven \
 apt-transport-https ca-certificates gnupg2 software-properties-common docker.io openssh-client -y
# Configure ssh client
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa




