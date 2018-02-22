FROM node:9.5.0

RUN apt-get update && \
    apt-get -y install less python python-pip python-dev groff && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV SERVERLESS_VERSION=1.26.0

RUN npm install -g serverless@$SERVERLESS_VERSION && \
    mkdir -p /serverless && \
    chown node /serverless

USER node

RUN pip install --user awscli && \
    mkdir -p /home/node/.aws

ENV PATH /home/node/.local/bin:$PATH

VOLUME "/serverless"
VOLUME "/home/node/.aws"

WORKDIR /serverless

CMD ["sls", "--help"]
