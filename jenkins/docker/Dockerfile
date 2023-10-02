# Use the official Jenkins LTS base image
FROM jenkins/jenkins:lts

# Switch to the root user to install packages
USER root

# Install Docker prerequisites
RUN apt-get update \
    && apt-get install -y apt-transport-https ca-certificates curl software-properties-common


RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
RUN apt update
RUN apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
RUN apt-get install -y tini

# Switch back to the Jenkins user
USER jenkins
#RUN usermod -aG docker ${USER}

# Set environment variable for Docker host
ENV DOCKER_HOST=unix:///var/run/docker.sock

# Add any additional configurations if needed

# Start Jenkins
CMD ["tini", "--", "/usr/local/bin/jenkins.sh"]
