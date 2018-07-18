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

#ENTRYPOINT ["npm", "start", "--", "--appId",  "myappid", "--masterKey", "mymasterkey",  "--serverURL", "http://10.129.1.222/parse", "--databaseURI", "mongodb://mongouser:password@172.30.224.52:27017/sampledb"]
ENTRYPOINT ["npm", "start", "--", "--appId",  "myAppId", "--masterKey", "myMasterKey",  "--serverURL", "https://parse-server.stratpoint.io/parse", "--databaseURI", "mongodb://mongouser:password@172.30.43.11:27017/sampledb", "--push", '{"android":{"apiKey":"AIzaSyDUlyNVtt9QpElEpmaIgpObPogmxgHbAVc"},"ios":{"token":{"key":"AuthKey_HF29KLBA82.p8","keyId":"HF29KLBA82","teamId":"A8PVFGP356"},"topic":"com.stratpoint.brewery","production":true}}']
