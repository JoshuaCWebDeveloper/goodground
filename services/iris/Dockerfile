FROM node:14

WORKDIR /usr/src/app

COPY ./iris-messenger/package.json .
COPY ./iris-messenger/build/ build
RUN npm install sirv-cli

CMD ["npm", "run", "serve"]