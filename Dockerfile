FROM node:11.9.0

RUN apt-get update && \
    apt-get -y install less python python-pip python-dev groff && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV SERVERLESS_VERSION=1.37.1
ENV WT_VERSION=11.0.2

RUN npm install -g serverless@$SERVERLESS_VERSION && \
	npm install -g wt-cli@$WT_VERSION && \
    mkdir -p /serverless && \
    chown -R node /serverless

USER node

RUN pip install --user awscli && \
    mkdir -p /home/node/.aws

ENV PATH /home/node/.local/bin:$PATH

WORKDIR /serverless

CMD ["sls", "--help"]
