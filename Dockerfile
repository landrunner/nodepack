FROM node:18

RUN apt-get update && \
    apt-get -y install cmake jq && \
    apt-get clean --yes

USER node

ADD entrypoint.sh /home/node/

ENTRYPOINT [ "/home/node/entrypoint.sh" ]

