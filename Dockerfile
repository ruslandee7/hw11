FROM ubuntu:18.04
RUN apt update
RUN apt install openjdk-8-jre git maven openssh-client docker.io -y
# Configure ssh client
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa
# Install docker 18.03
RUN apt-get install \
    ca-certificates \
    curl \
    gnupg -y
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN chmod a+r /etc/apt/keyrings/docker.gpg
RUN echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
RUN tee /etc/apt/sources.list.d/docker.list > /dev/null