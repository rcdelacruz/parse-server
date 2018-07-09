FROM node:carbon

RUN mkdir -p /parse-server
COPY ./ /parse-server/

ENV APP_ID myappid
ENV MASTER_KEY mymasterkey
ENV DATABASE_URI mongodb://mongouser:password@localhost:27017/parsedb

RUN mkdir -p /parse-server/config
VOLUME /parse-server/config

RUN mkdir -p /parse-server/cloud
VOLUME /parse-server/cloud

WORKDIR /parse-server

RUN npm install && \
    npm run build


EXPOSE 8080

ENTRYPOINT ["npm", "start", "--"]
