FROM node:14
RUN apt-get update && apt-get install git imagemagick -y;

WORKDIR /ecs-app

COPY package*.json ./
COPY controller controller
COPY server.js server.js

RUN npm install
RUN chown -R node:node /ecs-app

ENV NODE_ENV=production
ENV ENV_ECS=true
ENV PORT=8080
USER node
EXPOSE $PORT

ENTRYPOINT ["npm", "start"]
