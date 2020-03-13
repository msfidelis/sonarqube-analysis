FROM openjdk:8-alpine

ARG RELEASE=3.3.0.1492

WORKDIR /app

RUN apk add --no-cache bash curl grep sed unzip nodejs npm git

# ADD entrypoint.sh /entrypoint.sh

# RUN chmod +x /entrypoint.sh

RUN wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$RELEASE-linux.zip -O /opt/sonarscanner.zip && \
     cd /opt && \
     unzip sonarscanner.zip && \
     rm sonarscanner.zip && \
     rm sonar-scanner-$RELEASE-linux/jre -rf

RUN sed -i 's/use_embedded_jre=true/use_embedded_jre=false/g' /opt/sonar-scanner-$RELEASE-linux/bin/sonar-scanner

ENV SONAR_RUNNER_HOME=/opt/sonar-scanner-$RELEASE-linux
ENV PATH $PATH:/opt/sonar-scanner-$RELEASE-linux/bin


CMD [ "sonar-scanner", "-Dsonar.projectBaseDir=./" ]