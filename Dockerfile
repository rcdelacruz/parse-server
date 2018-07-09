FROM node:carbon

RUN mkdir -p /parse-server
COPY ./ /parse-server/

ENV APP_ID myappid
ENV MASTER_KEY mymasterkey
ENV DATABASE_URI mongodb://mongouser:password@localhost:27017/sampledb

RUN mkdir -p /parse-server/config
VOLUME /parse-server/config

RUN mkdir -p /parse-server/cloud
VOLUME /parse-server/cloud

WORKDIR /parse-server

RUN npm install && \
    npm install --global flow-bin && \
    npm run build 


EXPOSE 8080

ENTRYPOINT ["npm", "start", "--", "--appId",  "myappid", "--masterKey", "mymasterkey",  "--serverURL", "http://parse-server-api.52.23.233.62.xip.io/parse", "--databaseURI", "mongodb://mongouser:password@172.30.224.52:27017/sampledb"]
