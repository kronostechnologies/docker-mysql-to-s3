FROM node:8-alpine
MAINTAINER "sysadmin@kronostechnologies.com"

RUN apk update && apk upgrade && apk add --no-cache mariadb-client && rm -rf /var/cache/apk/*

WORKDIR /code
COPY ["package.json", ".yarnclean", "yarn.lock", "/code/"]
RUN yarn install && yarn clean && yarn cache clean
COPY [".env", "mysql2s3.js", "README.md", "LICENSE", "/code/"]

CMD ./mysql2s3.js