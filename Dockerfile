FROM node:6-alpine

RUN apk add --no-cache tini 

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install && npm cache clean --force

COPY . .

EXPOSE 3000

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["node", "bin/www"]

