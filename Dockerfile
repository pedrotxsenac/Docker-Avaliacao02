
FROM node:16-alpine AS development

WORKDIR /usr/src/app

COPY package*.json yarn.lock ./

RUN yarn install

COPY . .

CMD ["yarn", "start:dev"]

FROM node:16-alpine AS production

WORKDIR /usr/src/app

COPY package*.json yarn.lock ./

RUN yarn install --production

COPY . .

RUN yarn build
