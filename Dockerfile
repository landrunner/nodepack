FROM node:18-slim

RUN apt-get update && \
    apt-get -y install g++ cmake jq && \
    apt-get clean --yes && \
    rm -rf /var/lib/apt/lists/*
RUN npm install -g typescript

USER node

ADD entrypoint.sh /home/node/

ENTRYPOINT [ "/home/node/entrypoint.sh" ]

