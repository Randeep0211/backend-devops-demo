FROM node:22-alpine AS builder

WORKDIR /usr/src/app

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

#####################

FROM node:22-alpine AS release

WORKDIR /usr/src/app 

USER node

COPY --from=builder --chown=node:node /usr/src/app ./

EXPOSE 3001

ENTRYPOINT [ "npm", "run", "start" ]

