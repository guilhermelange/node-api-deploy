FROM node:alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# RUN npm install
# If you are building your code for production
RUN npm ci --omit=dev

RUN npm run build

# Bundle app source
COPY . .

LABEL org.opencontainers.image.source=https://github.com/guilhermelange/node-api-deploy

EXPOSE 3000
CMD [ "node", "dist/index.js" ]