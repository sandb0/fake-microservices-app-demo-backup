FROM node:alpine

WORKDIR /home/application

COPY package.json .
RUN yarn
COPY . .

CMD ["node", "index.js"]
